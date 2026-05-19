package dk.ek.shift_happens.shiftassignment;

import dk.ek.shift_happens.auth.AuthHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/shiftassignments")
@RequiredArgsConstructor
public class ShiftAssignmentController {

    private final ShiftAssignmentRepository shiftAssignmentRepository;
    private final AuthHelper authHelper;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<ShiftAssignmentDto> getShiftAssignments(Authentication auth) {
        List<ShiftAssignment> assignments = authHelper.isEmployee(auth)
                ? shiftAssignmentRepository.findByEmployeeId(authHelper.currentEmployeeId(auth))
                : this.shiftAssignmentRepository.findAll();
        return assignments.stream().map(ShiftAssignmentDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public ShiftAssignmentDto getShiftAssignmentById(@PathVariable Integer id, Authentication auth) {
        ShiftAssignment assignment = shiftAssignmentRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        if (authHelper.isEmployee(auth)
                && !assignment.getEmployeeId().equals(authHelper.currentEmployeeId(auth))) {
            throw authHelper.forbidden();
        }
        return ShiftAssignmentDto.from(assignment);
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftAssignmentDto createShiftAssignment(@RequestBody ShiftAssignmentDto shiftAssignment) {
        return ShiftAssignmentDto.from(this.shiftAssignmentRepository.save(shiftAssignment.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftAssignmentDto updateShiftAssignment(@PathVariable Integer id, @RequestBody ShiftAssignmentDto shiftAssignmentDetails) {
        ShiftAssignment shiftAssignment = this.shiftAssignmentRepository.findById(id).orElseThrow();
        shiftAssignment.setShiftId(shiftAssignmentDetails.shiftId());
        shiftAssignment.setEmployeeId(shiftAssignmentDetails.employeeId());
        shiftAssignment.setAssignmentStatus(shiftAssignmentDetails.assignmentStatus());
        shiftAssignment.setAssignedDatetime(shiftAssignmentDetails.assignedDatetime());
        shiftAssignment.setCheckInDatetime(shiftAssignmentDetails.checkInDatetime());
        shiftAssignment.setCheckOutDatetime(shiftAssignmentDetails.checkOutDatetime());
        return ShiftAssignmentDto.from(this.shiftAssignmentRepository.save(shiftAssignment));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public void deleteShiftAssignment(@PathVariable Integer id) {
        this.shiftAssignmentRepository.deleteById(id);
    }
}
