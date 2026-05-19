package dk.ek.shift_happens.worklocation.mongo;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/mongo/work_location")
@RequiredArgsConstructor
public class WorkLocationMongoController {

    private final WorkLocationMongoRepository workLocationMongoRepository;

    @GetMapping
    public List<WorkLocationDocumentDto> getAll() {
        return workLocationMongoRepository.findAll().stream().map(WorkLocationDocumentDto::from).toList();
    }

    @GetMapping("/{id}")
    public WorkLocationDocumentDto getById(@PathVariable String id) {
        return workLocationMongoRepository.findById(id)
                .map(WorkLocationDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public WorkLocationDocumentDto create(@RequestBody WorkLocationDocumentDto workLocation) {
        return WorkLocationDocumentDto.from(workLocationMongoRepository.save(workLocation.toEntity()));
    }

    @PutMapping("/{id}")
    public WorkLocationDocumentDto update(@PathVariable String id, @RequestBody WorkLocationDocumentDto workLocation) {
        if (!workLocationMongoRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        WorkLocationDocument entity = workLocation.toEntity();
        entity.setId(id);
        return WorkLocationDocumentDto.from(workLocationMongoRepository.save(entity));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable String id) {
        if (!workLocationMongoRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        workLocationMongoRepository.deleteById(id);
    }
}
