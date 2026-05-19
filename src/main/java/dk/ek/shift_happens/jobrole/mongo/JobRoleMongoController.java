package dk.ek.shift_happens.jobrole.mongo;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/mongo/job_role")
@RequiredArgsConstructor
public class JobRoleMongoController {

    private final JobRoleMongoRepository jobRoleMongoRepository;

    @GetMapping
    public List<JobRoleDocumentDto> getAll() {
        return jobRoleMongoRepository.findAll().stream().map(JobRoleDocumentDto::from).toList();
    }

    @GetMapping("/{id}")
    public JobRoleDocumentDto getById(@PathVariable String id) {
        return jobRoleMongoRepository.findById(id)
                .map(JobRoleDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public JobRoleDocumentDto create(@RequestBody JobRoleDocumentDto jobRole) {
        return JobRoleDocumentDto.from(jobRoleMongoRepository.save(jobRole.toEntity()));
    }

    @PutMapping("/{id}")
    public JobRoleDocumentDto update(@PathVariable String id, @RequestBody JobRoleDocumentDto jobRole) {
        if (!jobRoleMongoRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        JobRoleDocument entity = jobRole.toEntity();
        entity.setId(id);
        return JobRoleDocumentDto.from(jobRoleMongoRepository.save(entity));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable String id) {
        if (!jobRoleMongoRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        jobRoleMongoRepository.deleteById(id);
    }
}
