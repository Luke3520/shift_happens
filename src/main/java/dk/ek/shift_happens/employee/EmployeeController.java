package dk.ek.shift_happens.employee;

import dk.ek.shift_happens.auth.AuthHelper;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name = "Employees")
@RestController
@RequestMapping("/employees")
@RequiredArgsConstructor
public class EmployeeController {

    private final EmployeeService employeeService;
    private final AuthHelper authHelper;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<EmployeeDto> getEmployees(
            @RequestParam(required = false) String employmentStatus,
            @RequestParam(required = false) Integer primaryWorkLocationId,
            @RequestParam(required = false) UserRole userRole,
            @RequestParam(required = false) String email,
            @RequestParam(required = false) String firstName,
            @RequestParam(required = false) String lastName,
            Authentication auth) {
        if (authHelper.isEmployee(auth)) {
            Integer selfId = authHelper.currentEmployeeId(auth);
            Specification<Employee> spec = (root, query, cb) -> cb.equal(root.get("employeeId"), selfId);
            return this.employeeService.findAll(spec).stream().map(EmployeeDto::from).toList();
        } else {
            Specification<Employee> spec = (root, query, cb) -> cb.conjunction();
            if (employmentStatus != null) {
                spec = spec.and((root, query, cb) -> cb.equal(root.get("employmentStatus"), employmentStatus));
            }
            if (primaryWorkLocationId != null) {
                spec = spec.and((root, query, cb) -> cb.equal(root.get("primaryWorkLocationId"), primaryWorkLocationId));
            }
            if (userRole != null) {
                spec = spec.and((root, query, cb) -> cb.equal(root.get("userRole"), userRole));
            }
            if (email != null) {
                spec = spec.and((root, query, cb) -> cb.like(cb.lower(root.get("email")), "%" + email.toLowerCase() + "%"));
            }
            if (firstName != null) {
                spec = spec.and((root, query, cb) -> cb.like(cb.lower(root.get("firstName")), "%" + firstName.toLowerCase() + "%"));
            }
            if (lastName != null) {
                spec = spec.and((root, query, cb) -> cb.like(cb.lower(root.get("lastName")), "%" + lastName.toLowerCase() + "%"));
            }

            return this.employeeService.findAll(spec).stream().map(EmployeeDto::from).toList();
        }
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<EmployeeDto> getEmployee(@PathVariable Integer id, Authentication auth) {
        if (authHelper.isEmployee(auth) && !id.equals(authHelper.currentEmployeeId(auth))) {
            throw authHelper.forbidden();
        }
        return this.employeeService.findById(id)
                .map(EmployeeDto::from)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ResponseEntity<EmployeeDto> createEmployee(@RequestBody EmployeeDto employee) {
        Employee created = this.employeeService.save(employee.toEntity());
        return ResponseEntity.status(201).body(EmployeeDto.from(created));
    }

    @PatchMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ResponseEntity<EmployeeDto> patchEmployee(@PathVariable Integer id, @RequestBody EmployeeDto employee) {
        return this.employeeService.patch(id, employee.toEntity())
                .map(EmployeeDto::from)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ResponseEntity<Void> deleteEmployee(@PathVariable Integer id) {
        employeeService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
