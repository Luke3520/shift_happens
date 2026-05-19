package dk.ek.shift_happens.leaveapproval;

import dk.ek.shift_happens.auth.AuthHelper;
import dk.ek.shift_happens.leaverequest.LeaveRequestService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name = "Leave Approvals")
@RestController
@RequestMapping("/leaveapprovals")
@RequiredArgsConstructor
public class LeaveApprovalController {

    private final LeaveApprovalService leaveApprovalService;
    private final LeaveRequestService leaveRequestService;
    private final AuthHelper authHelper;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<List<LeaveApprovalDto>> getLeaveApprovals(Authentication auth) {
        List<LeaveApproval> approvals = authHelper.isEmployee(auth)
                ? this.leaveApprovalService.findByRequestOwner(authHelper.currentEmployeeId(auth))
                : this.leaveApprovalService.findAll();
        return ResponseEntity.ok(approvals.stream().map(LeaveApprovalDto::from).toList());
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<LeaveApprovalDto> getLeaveApproval(@PathVariable Integer id, Authentication auth) {
        return this.leaveApprovalService.findById(id)
                .map(approval -> {
                    if (authHelper.isEmployee(auth) && !ownsRequest(approval.getLeaveRequestId(), auth)) {
                        throw authHelper.forbidden();
                    }
                    return ResponseEntity.ok(LeaveApprovalDto.from(approval));
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/request/{leaveRequestId}")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<List<LeaveApprovalDto>> getApprovalsForRequest(@PathVariable Integer leaveRequestId,
                                                                         Authentication auth) {
        if (authHelper.isEmployee(auth) && !ownsRequest(leaveRequestId, auth)) {
            throw authHelper.forbidden();
        }
        return ResponseEntity.ok(this.leaveApprovalService.findByLeaveRequestId(leaveRequestId)
                .stream().map(LeaveApprovalDto::from).toList());
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ResponseEntity<LeaveApprovalDto> createLeaveApproval(@RequestBody LeaveApprovalDto leaveApproval) {
        LeaveApproval created = this.leaveApprovalService.approve(leaveApproval.toEntity());
        return ResponseEntity.status(201).body(LeaveApprovalDto.from(created));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ResponseEntity<LeaveApprovalDto> updateLeaveApproval(@PathVariable Integer id,
                                                                @RequestBody LeaveApprovalDto leaveApproval) {
        return this.leaveApprovalService.update(id, leaveApproval.toEntity())
                .map(LeaveApprovalDto::from)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ResponseEntity<Void> deleteLeaveApproval(@PathVariable Integer id) {
        return this.leaveApprovalService.delete(id)
                ? ResponseEntity.noContent().build()
                : ResponseEntity.notFound().build();
    }

    private boolean ownsRequest(Integer leaveRequestId, Authentication auth) {
        return leaveRequestService.findById(leaveRequestId)
                .map(lr -> lr.getEmployeeId().equals(authHelper.currentEmployeeId(auth)))
                .orElse(false);
    }
}
