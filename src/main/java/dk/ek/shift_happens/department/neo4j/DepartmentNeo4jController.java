package dk.ek.shift_happens.department.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/neo4j/departments")
@RequiredArgsConstructor
public class DepartmentNeo4jController {

    private final DepartmentNeo4jRepository departmentNeo4jRepository;

    @GetMapping
    public List<DepartmentNodeDto> getAll() {
        return departmentNeo4jRepository.findAll().stream().map(DepartmentNodeDto::from).toList();
    }

    @GetMapping("/{id}")
    public DepartmentNodeDto getById(@PathVariable Long id) {
        return departmentNeo4jRepository.findById(id)
                .map(DepartmentNodeDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }
}
