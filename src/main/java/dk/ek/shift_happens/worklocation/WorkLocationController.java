package dk.ek.shift_happens.worklocation;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Tag(name = "Work Locations")
@RestController
@RequestMapping("/worklocations")
@RequiredArgsConstructor
public class WorkLocationController {

    private final WorkLocationService workLocationService;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<WorkLocationDto> getAll() {
        return workLocationService.findAll().stream().map(WorkLocationDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public WorkLocationDto getById(@PathVariable Integer id) {
        return workLocationService.findById(id)
                .map(WorkLocationDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.CREATED)
    public WorkLocationDto create(@RequestBody WorkLocationDto workLocation) {
        return WorkLocationDto.from(workLocationService.create(workLocation.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public WorkLocationDto update(@PathVariable Integer id, @RequestBody WorkLocationDto details) {
        return workLocationService.update(id, details.toEntity())
                .map(WorkLocationDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) {
        workLocationService.delete(id);
    }
}
