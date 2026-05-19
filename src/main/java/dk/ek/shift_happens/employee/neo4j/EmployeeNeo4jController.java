package dk.ek.shift_happens.employee.neo4j;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Tag(name = "Neo4j - Employees")
@RestController
@RequestMapping("/neo4j/employees")
@RequiredArgsConstructor
public class EmployeeNeo4jController {

    private final EmployeeNeo4jRepository employeeNeo4jRepository;

    @GetMapping
    public List<EmployeeNode> getAll() {
        return employeeNeo4jRepository.findAll();
    }

    @GetMapping("/{id}")
    public EmployeeNode getById(@PathVariable Long id) {
        return employeeNeo4jRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }
}
