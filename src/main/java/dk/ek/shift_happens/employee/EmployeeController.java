package dk.ek.shift_happens.employee;

import dk.ek.shift_happens.auth.AuthHelper;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
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
    public ResponseEntity<List<EmployeeDto>> getEmployees(Authentication auth) {
        List<Employee> employees;
        if (authHelper.isEmployee(auth)) {
            Integer selfId = authHelper.currentEmployeeId(auth);
            employees = this.employeeService.findById(selfId).map(List::of).orElse(List.of());
        } else {
            employees = this.employeeService.findAll();
        }
        return ResponseEntity.ok(employees.stream().map(EmployeeDto::from).toList());
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
