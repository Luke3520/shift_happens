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

    private final LeaveTypeService leaveTypeService;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<LeaveTypeDto> getAll() {
        return leaveTypeService.findAll().stream().map(LeaveTypeDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public LeaveTypeDto getById(@PathVariable Integer id) {
        return leaveTypeService.findById(id)
                .map(LeaveTypeDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.CREATED)
    public LeaveTypeDto create(@RequestBody LeaveTypeDto leaveType) {
        return LeaveTypeDto.from(leaveTypeService.create(leaveType.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public LeaveTypeDto update(@PathVariable Integer id, @RequestBody LeaveTypeDto details) {
        return leaveTypeService.update(id, details.toEntity())
                .map(LeaveTypeDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) {
        leaveTypeService.delete(id);
    }
}
