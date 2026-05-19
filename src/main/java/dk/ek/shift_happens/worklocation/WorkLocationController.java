package dk.ek.shift_happens.worklocation;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/worklocations")
@RequiredArgsConstructor
public class WorkLocationController {

    private final WorkLocationRepository workLocationRepository;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<WorkLocationDto> getAll() {
        return workLocationRepository.findAll().stream().map(WorkLocationDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public WorkLocationDto getById(@PathVariable Integer id) {
        return workLocationRepository.findById(id)
                .map(WorkLocationDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.CREATED)
    public WorkLocationDto create(@RequestBody WorkLocationDto workLocation) {
        return WorkLocationDto.from(workLocationRepository.save(workLocation.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public WorkLocationDto update(@PathVariable Integer id, @RequestBody WorkLocationDto details) {
        WorkLocation existing = workLocationRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        existing.setLocationName(details.locationName());
        existing.setAddressLine1(details.addressLine1());
        existing.setAddressLine2(details.addressLine2());
        existing.setCity(details.city());
        existing.setCountry(details.country());
        existing.setTimezone(details.timezone());
        existing.setIsActive(details.isActive());
        return WorkLocationDto.from(workLocationRepository.save(existing));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) {
        workLocationRepository.deleteById(id);
    }
}
