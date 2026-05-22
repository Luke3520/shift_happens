package dk.ek.shift_happens.employee.neo4j;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Tag(name = "Neo4j - Employees")
@RestController
@RequestMapping("/neo4j/employees")
@RequiredArgsConstructor
public class EmployeeNeo4jController {

    private final EmployeeNeo4jService employeeNeo4jService;

    @GetMapping
    public Page<EmployeeNodeDto> getAll(
            @RequestParam(required = false) String employmentStatus,
            @RequestParam(required = false) Integer primaryWorkLocationId,
            @RequestParam(required = false) String userRole,
            @RequestParam(required = false) String email,
            @RequestParam(required = false) String firstName,
            @RequestParam(required = false) String lastName,
            @ParameterObject Pageable pageable) {
        return employeeNeo4jService.findAll(employmentStatus, primaryWorkLocationId, userRole, email, firstName, lastName, pageable)
                .map(EmployeeNodeDto::from);
    }

    @GetMapping("/{id}")
    public EmployeeNodeDto getById(@PathVariable Long id) {
        return employeeNeo4jService.findById(id)
                .map(EmployeeNodeDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }
}
