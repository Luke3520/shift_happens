package dk.ek.shift_happens.shiftrequiredjobrole;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/shiftrequiredjobroles")
@RequiredArgsConstructor
public class ShiftRequiredJobRoleController {

    private final ShiftRequiredJobRoleRepository shiftRequiredJobRoleRepository;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<ShiftRequiredJobRoleDto> getShiftRequiredJobRoles() {
        return this.shiftRequiredJobRoleRepository.findAll().stream()
                .map(ShiftRequiredJobRoleDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public Optional<ShiftRequiredJobRoleDto> getShiftRequiredJobRoleById(@PathVariable Integer id) {
        return this.shiftRequiredJobRoleRepository.findById(id).map(ShiftRequiredJobRoleDto::from);
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftRequiredJobRoleDto createShiftRequiredJobRole(@RequestBody ShiftRequiredJobRoleDto shiftRequiredJobRole) {
        return ShiftRequiredJobRoleDto.from(this.shiftRequiredJobRoleRepository.save(shiftRequiredJobRole.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftRequiredJobRoleDto updateShiftRequiredJobRole(@PathVariable Integer id, @RequestBody ShiftRequiredJobRoleDto shiftRequiredJobRoleDetails) {
        ShiftRequiredJobRole shiftRequiredJobRole = this.shiftRequiredJobRoleRepository.findById(id).orElseThrow();
        shiftRequiredJobRole.setShiftId(shiftRequiredJobRoleDetails.shiftId());
        shiftRequiredJobRole.setJobRoleId(shiftRequiredJobRoleDetails.jobRoleId());
        shiftRequiredJobRole.setRequiredEmployeeCount(shiftRequiredJobRoleDetails.requiredEmployeeCount());
        return ShiftRequiredJobRoleDto.from(this.shiftRequiredJobRoleRepository.save(shiftRequiredJobRole));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public void deleteShiftRequiredJobRole(@PathVariable Integer id) {
        this.shiftRequiredJobRoleRepository.deleteById(id);
    }
}
