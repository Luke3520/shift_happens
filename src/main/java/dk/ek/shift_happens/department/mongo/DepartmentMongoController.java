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

    private final DepartmentMongoService departmentMongoService;

    @GetMapping
    public List<DepartmentDocumentDto> getAll() {
        return departmentMongoService.findAll().stream().map(DepartmentDocumentDto::from).toList();
    }

    @GetMapping("/{id}")
    public DepartmentDocumentDto getById(@PathVariable String id) {
        return departmentMongoService.findById(id)
                .map(DepartmentDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public DepartmentDocumentDto create(@RequestBody DepartmentDocumentDto department) {
        return DepartmentDocumentDto.from(departmentMongoService.create(department.toEntity()));
    }

    @PutMapping("/{id}")
    public DepartmentDocumentDto update(@PathVariable String id, @RequestBody DepartmentDocumentDto department) {
        return departmentMongoService.update(id, department.toEntity())
                .map(DepartmentDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable String id) {
        if (!departmentMongoService.delete(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }
}
