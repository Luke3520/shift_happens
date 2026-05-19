package dk.ek.shift_happens.employee.mongo;

import dk.ek.shift_happens.employee.UserRole;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Tag(name = "MongoDB - Employees")
@RestController
@RequestMapping("/mongo/employees")
@RequiredArgsConstructor
public class EmployeeMongoController {

    private final EmployeeMongoService employeeMongoService;

    @GetMapping
    public Page<EmployeeDocumentDto> getAll(
            @RequestParam(required = false) String employmentStatus,
            @RequestParam(required = false) Integer primaryWorkLocationId,
            @RequestParam(required = false) String userRole,
            @RequestParam(required = false) String email,
            @RequestParam(required = false) String firstName,
            @RequestParam(required = false) String lastName,
            @ParameterObject Pageable pageable) {
        return employeeMongoService.findAll(employmentStatus, primaryWorkLocationId, userRole, email, firstName, lastName, pageable)
                .map(EmployeeDocumentDto::from);
    }

    @GetMapping("/{id}")
    public EmployeeDocumentDto getById(@PathVariable Integer id) {
        return employeeMongoService.findById(id)
                .map(EmployeeDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public EmployeeDocumentDto create(@RequestBody EmployeeDocumentDto employee) {
        return EmployeeDocumentDto.from(employeeMongoService.create(employee.toEntity()));
    }

    @PutMapping("/{id}")
    public EmployeeDocumentDto update(@PathVariable Integer id, @RequestBody EmployeeDocumentDto employee) {
        return employeeMongoService.update(id, employee.toEntity())
                .map(EmployeeDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) {
        if (!employeeMongoService.delete(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }
}
