package dk.ek.shift_happens.jobrole.neo4j;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Tag(name = "Neo4j - Job Roles")
@RestController
@RequestMapping("/neo4j/jobroles")
@RequiredArgsConstructor
public class JobRoleNeo4jController {

    private final JobRoleNeo4jService jobRoleNeo4jService;

    @GetMapping
    public List<JobRoleNodeDto> getAll() {
        return jobRoleNeo4jService.findAll().stream().map(JobRoleNodeDto::from).toList();
    }

    @GetMapping("/{id}")
    public JobRoleNodeDto getById(@PathVariable Long id) {
        return jobRoleNeo4jService.findById(id)
                .map(JobRoleNodeDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }
}
