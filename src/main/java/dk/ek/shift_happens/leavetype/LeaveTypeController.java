package dk.ek.shift_happens.leavetype;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/leavetypes")
@RequiredArgsConstructor
public class LeaveTypeController {

    private final LeaveTypeRepository leaveTypeRepository;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<LeaveTypeDto> getAll() {
        return leaveTypeRepository.findAll().stream().map(LeaveTypeDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public LeaveTypeDto getById(@PathVariable Integer id) {
        return leaveTypeRepository.findById(id)
                .map(LeaveTypeDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.CREATED)
    public LeaveTypeDto create(@RequestBody LeaveTypeDto leaveType) {
        return LeaveTypeDto.from(leaveTypeRepository.save(leaveType.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public LeaveTypeDto update(@PathVariable Integer id, @RequestBody LeaveTypeDto details) {
        LeaveType existing = leaveTypeRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        existing.setLeaveTypeName(details.leaveTypeName());
        existing.setLeaveTypeDescription(details.leaveTypeDescription());
        existing.setRequiresApproval(details.requiresApproval());
        existing.setIsPaidLeave(details.isPaidLeave());
        return LeaveTypeDto.from(leaveTypeRepository.save(existing));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) {
        leaveTypeRepository.deleteById(id);
    }
}
