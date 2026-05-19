package dk.ek.shift_happens.employee.mongo;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/mongo/employees")
@RequiredArgsConstructor
public class EmployeeMongoController {

    private final EmployeeMongoRepository employeeMongoRepository;

    @GetMapping
    public List<EmployeeDocumentDto> getAll() {
        return employeeMongoRepository.findAll().stream().map(EmployeeDocumentDto::from).toList();
    }

    @GetMapping("/{id}")
    public EmployeeDocumentDto getById(@PathVariable Integer id) {
        return employeeMongoRepository.findById(id)
                .map(EmployeeDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public EmployeeDocumentDto create(@RequestBody EmployeeDocumentDto employee) {
        return EmployeeDocumentDto.from(employeeMongoRepository.save(employee.toEntity()));
    }

    @PutMapping("/{id}")
    public EmployeeDocumentDto update(@PathVariable Integer id, @RequestBody EmployeeDocumentDto employee) {
        if (!employeeMongoRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        EmployeeDocument entity = employee.toEntity();
        entity.setEmployeeId(id);
        return EmployeeDocumentDto.from(employeeMongoRepository.save(entity));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) {
        if (!employeeMongoRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        employeeMongoRepository.deleteById(id);
    }
}
