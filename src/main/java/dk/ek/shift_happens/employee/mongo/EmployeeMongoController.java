package dk.ek.shift_happens.employee.mongo;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Tag(name = "MongoDB - Employees")
@RestController
@RequestMapping("/mongo/employees")
@RequiredArgsConstructor
public class EmployeeMongoController {

    private final EmployeeMongoService employeeMongoService;

    @GetMapping
    public List<EmployeeDocumentDto> getAll() {
        return employeeMongoService.findAll().stream().map(EmployeeDocumentDto::from).toList();
    }

    @GetMapping("/{id}")
    public EmployeeDocumentDto getById(@PathVariable Integer id) {
        return employeeMongoService.findById(id)
                .map(EmployeeDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public EmployeeDocumentDto create(@RequestBody EmployeeDocumentDto employee) {
        return EmployeeDocumentDto.from(employeeMongoService.create(employee.toEntity()));
    }

    @PutMapping("/{id}")
    public EmployeeDocumentDto update(@PathVariable Integer id, @RequestBody EmployeeDocumentDto employee) {
        return employeeMongoService.update(id, employee.toEntity())
                .map(EmployeeDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) {
        if (!employeeMongoService.delete(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }
}
