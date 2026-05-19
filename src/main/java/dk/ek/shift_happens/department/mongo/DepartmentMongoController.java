package dk.ek.shift_happens.department.mongo;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/mongo/departments")
@RequiredArgsConstructor
public class DepartmentMongoController {

    private final DepartmentMongoRepository departmentMongoRepository;

    @GetMapping
    public List<DepartmentDocumentDto> getAll() {
        return departmentMongoRepository.findAll().stream().map(DepartmentDocumentDto::from).toList();
    }

    @GetMapping("/{id}")
    public DepartmentDocumentDto getById(@PathVariable String id) {
        return departmentMongoRepository.findById(id)
                .map(DepartmentDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public DepartmentDocumentDto create(@RequestBody DepartmentDocumentDto department) {
        return DepartmentDocumentDto.from(departmentMongoRepository.save(department.toEntity()));
    }

    @PutMapping("/{id}")
    public DepartmentDocumentDto update(@PathVariable String id, @RequestBody DepartmentDocumentDto department) {
        if (!departmentMongoRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        DepartmentDocument entity = department.toEntity();
        entity.setId(id);
        return DepartmentDocumentDto.from(departmentMongoRepository.save(entity));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable String id) {
        if (!departmentMongoRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        departmentMongoRepository.deleteById(id);
    }
}
