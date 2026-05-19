package dk.ek.shift_happens.jobrole.mongo;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Tag(name = "MongoDB - Job Roles")
@RestController
@RequestMapping("/mongo/job_role")
@RequiredArgsConstructor
public class JobRoleMongoController {

    private final JobRoleMongoService jobRoleMongoService;

    @GetMapping
    public List<JobRoleDocumentDto> getAll() {
        return jobRoleMongoService.findAll().stream().map(JobRoleDocumentDto::from).toList();
    }

    @GetMapping("/{id}")
    public JobRoleDocumentDto getById(@PathVariable String id) {
        return jobRoleMongoService.findById(id)
                .map(JobRoleDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public JobRoleDocumentDto create(@RequestBody JobRoleDocumentDto jobRole) {
        return JobRoleDocumentDto.from(jobRoleMongoService.create(jobRole.toEntity()));
    }

    @PutMapping("/{id}")
    public JobRoleDocumentDto update(@PathVariable String id, @RequestBody JobRoleDocumentDto jobRole) {
        return jobRoleMongoService.update(id, jobRole.toEntity())
                .map(JobRoleDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable String id) {
        if (!jobRoleMongoService.delete(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }
}
