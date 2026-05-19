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

    private final ShiftRequiredJobRoleService shiftRequiredJobRoleService;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<ShiftRequiredJobRoleDto> getShiftRequiredJobRoles() {
        return this.shiftRequiredJobRoleService.findAll().stream()
                .map(ShiftRequiredJobRoleDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public Optional<ShiftRequiredJobRoleDto> getShiftRequiredJobRoleById(@PathVariable Integer id) {
        return this.shiftRequiredJobRoleService.findById(id).map(ShiftRequiredJobRoleDto::from);
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftRequiredJobRoleDto createShiftRequiredJobRole(@RequestBody ShiftRequiredJobRoleDto shiftRequiredJobRole) {
        return ShiftRequiredJobRoleDto.from(this.shiftRequiredJobRoleService.create(shiftRequiredJobRole.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftRequiredJobRoleDto updateShiftRequiredJobRole(@PathVariable Integer id, @RequestBody ShiftRequiredJobRoleDto shiftRequiredJobRoleDetails) {
        return this.shiftRequiredJobRoleService.update(id, shiftRequiredJobRoleDetails.toEntity())
                .map(ShiftRequiredJobRoleDto::from)
                .orElseThrow();
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public void deleteShiftRequiredJobRole(@PathVariable Integer id) {
        this.shiftRequiredJobRoleService.delete(id);
    }
}
