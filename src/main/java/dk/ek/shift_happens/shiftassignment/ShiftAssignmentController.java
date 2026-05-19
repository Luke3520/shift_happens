package dk.ek.shift_happens.shiftassignment;

import dk.ek.shift_happens.auth.AuthHelper;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Tag(name = "Shift Assignments")
@RestController
@RequestMapping("/shiftassignments")
@RequiredArgsConstructor
public class ShiftAssignmentController {

    private final ShiftAssignmentService shiftAssignmentService;
    private final AuthHelper authHelper;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<ShiftAssignmentDto> getShiftAssignments(Authentication auth) {
        List<ShiftAssignment> assignments = authHelper.isEmployee(auth)
                ? shiftAssignmentService.findByEmployeeId(authHelper.currentEmployeeId(auth))
                : shiftAssignmentService.findAll();
        return assignments.stream().map(ShiftAssignmentDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public ShiftAssignmentDto getShiftAssignmentById(@PathVariable Integer id, Authentication auth) {
        ShiftAssignment assignment = shiftAssignmentService.findById(id)
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
        return ShiftAssignmentDto.from(shiftAssignmentService.create(shiftAssignment.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftAssignmentDto updateShiftAssignment(@PathVariable Integer id, @RequestBody ShiftAssignmentDto shiftAssignmentDetails) {
        return shiftAssignmentService.update(id, shiftAssignmentDetails.toEntity())
                .map(ShiftAssignmentDto::from)
                .orElseThrow();
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public void deleteShiftAssignment(@PathVariable Integer id) {
        shiftAssignmentService.delete(id);
    }
}
