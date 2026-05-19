package dk.ek.shift_happens.worklocation.mongo;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Tag(name = "MongoDB - Work Locations")
@RestController
@RequestMapping("/mongo/work_location")
@RequiredArgsConstructor
public class WorkLocationMongoController {

    private final WorkLocationMongoService workLocationMongoService;

    @GetMapping
    public List<WorkLocationDocumentDto> getAll() {
        return workLocationMongoService.findAll().stream().map(WorkLocationDocumentDto::from).toList();
    }

    @GetMapping("/{id}")
    public WorkLocationDocumentDto getById(@PathVariable String id) {
        return workLocationMongoService.findById(id)
                .map(WorkLocationDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public WorkLocationDocumentDto create(@RequestBody WorkLocationDocumentDto workLocation) {
        return WorkLocationDocumentDto.from(workLocationMongoService.create(workLocation.toEntity()));
    }

    @PutMapping("/{id}")
    public WorkLocationDocumentDto update(@PathVariable String id, @RequestBody WorkLocationDocumentDto workLocation) {
        return workLocationMongoService.update(id, workLocation.toEntity())
                .map(WorkLocationDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable String id) {
        if (!workLocationMongoService.delete(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }
}
