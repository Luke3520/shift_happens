package dk.ek.shift_happens.jobrole;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/jobroles")
@RequiredArgsConstructor
public class JobRoleController {

    private final JobRoleRepository jobRoleRepository;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<JobRoleDto> getAll() {
        return jobRoleRepository.findAll().stream().map(JobRoleDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public JobRoleDto getById(@PathVariable Integer id) {
        return jobRoleRepository.findById(id)
                .map(JobRoleDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.CREATED)
    public JobRoleDto create(@RequestBody JobRoleDto jobRole) {
        return JobRoleDto.from(jobRoleRepository.save(jobRole.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public JobRoleDto update(@PathVariable Integer id, @RequestBody JobRoleDto details) {
        JobRole existing = jobRoleRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        existing.setRoleName(details.roleName());
        existing.setJobRoleDescription(details.jobRoleDescription());
        existing.setIsCertificationRequired(details.isCertificationRequired());
        return JobRoleDto.from(jobRoleRepository.save(existing));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) {
        jobRoleRepository.deleteById(id);
    }
}
