package dk.ek.shift_happens.employeejobrole;

import dk.ek.shift_happens.auth.AuthHelper;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name = "Employee Job Roles")
@RestController
@RequestMapping("/employeejobroles")
@RequiredArgsConstructor
public class EmployeeJobRoleController {

    private final EmployeeJobRoleService service;
    private final AuthHelper authHelper;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<EmployeeJobRoleDto> getAll(Authentication auth) {
        List<EmployeeJobRole> roles = authHelper.isEmployee(auth)
                ? service.getByEmployeeId(authHelper.currentEmployeeId(auth))
                : service.getAll();
        return roles.stream().map(EmployeeJobRoleDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public EmployeeJobRoleDto getById(@PathVariable Integer id, Authentication auth) {
        EmployeeJobRole role = service.getById(id);

        if (authHelper.isEmployee(auth)
                && !role.getEmployeeId().equals(authHelper.currentEmployeeId(auth))) {
            throw authHelper.forbidden();
        }
        return EmployeeJobRoleDto.from(role);
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public EmployeeJobRoleDto create(@RequestBody EmployeeJobRoleDto role) {
        return EmployeeJobRoleDto.from(service.create(role.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public EmployeeJobRoleDto update(@PathVariable Integer id, @RequestBody EmployeeJobRoleDto role) {
        return EmployeeJobRoleDto.from(service.update(id, role.toEntity()));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public void delete(@PathVariable Integer id) {
        service.delete(id);
    }
}
