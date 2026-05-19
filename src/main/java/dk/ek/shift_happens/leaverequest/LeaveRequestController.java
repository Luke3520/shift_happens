package dk.ek.shift_happens.leaverequest;

import dk.ek.shift_happens.auth.AuthHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/leaverequests")
@RequiredArgsConstructor
public class LeaveRequestController {

    private final LeaveRequestService leaveRequestService;
    private final AuthHelper authHelper;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<List<LeaveRequestDto>> getLeaveRequests(Authentication auth) {
        List<LeaveRequest> requests = authHelper.isEmployee(auth)
                ? this.leaveRequestService.findByEmployeeId(authHelper.currentEmployeeId(auth))
                : this.leaveRequestService.findAll();
        return ResponseEntity.ok(requests.stream().map(LeaveRequestDto::from).toList());
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<LeaveRequestDto> getLeaveRequest(@PathVariable Integer id, Authentication auth) {
        return this.leaveRequestService.findById(id)
                .map(req -> {
                    if (authHelper.isEmployee(auth)
                            && !req.getEmployeeId().equals(authHelper.currentEmployeeId(auth))) {
                        throw authHelper.forbidden();
                    }
                    return ResponseEntity.ok(LeaveRequestDto.from(req));
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ResponseEntity<LeaveRequestDto> createLeaveRequest(@RequestBody LeaveRequestDto leaveRequest) {
        LeaveRequest created = this.leaveRequestService.create(leaveRequest.toEntity());
        return ResponseEntity.status(201).body(LeaveRequestDto.from(created));
    }

    @PatchMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ResponseEntity<LeaveRequestDto> patchLeaveRequest(@PathVariable Integer id, @RequestBody LeaveRequestDto leaveRequest) {
        return this.leaveRequestService.patch(id, leaveRequest.toEntity())
                .map(LeaveRequestDto::from)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ResponseEntity<Void> deleteLeaveRequest(@PathVariable Integer id) {
        return this.leaveRequestService.delete(id)
                ? ResponseEntity.noContent().build()
                : ResponseEntity.notFound().build();
    }
}
