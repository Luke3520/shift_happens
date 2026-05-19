package dk.ek.shift_happens.jobrole;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Tag(name = "Job Roles")
@RestController
@RequestMapping("/jobroles")
@RequiredArgsConstructor
public class JobRoleController {

    private final JobRoleService jobRoleService;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<JobRoleDto> getAll() {
        return jobRoleService.findAll().stream().map(JobRoleDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public JobRoleDto getById(@PathVariable Integer id) {
        return jobRoleService.findById(id)
                .map(JobRoleDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.CREATED)
    public JobRoleDto create(@RequestBody JobRoleDto jobRole) {
        return JobRoleDto.from(jobRoleService.create(jobRole.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public JobRoleDto update(@PathVariable Integer id, @RequestBody JobRoleDto details) {
        return jobRoleService.update(id, details.toEntity())
                .map(JobRoleDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) {
        jobRoleService.delete(id);
    }
}
