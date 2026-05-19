package dk.ek.shift_happens.department;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/departments")
@RequiredArgsConstructor
public class DepartmentController {

    private final DepartmentService departmentService;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<DepartmentDto> getAll() {
        return departmentService.findAll().stream().map(DepartmentDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public DepartmentDto getById(@PathVariable Integer id) {
        return DepartmentDto.from(departmentService.findById(id));
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.CREATED)
    public DepartmentDto create(@RequestBody DepartmentDto department) {
        return DepartmentDto.from(departmentService.create(department.toEntity()));
    }

    @PatchMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public DepartmentDto update(@PathVariable Integer id, @RequestBody DepartmentDto department) {
        return DepartmentDto.from(departmentService.update(id, department.toEntity()));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) {
        departmentService.delete(id);
    }
}
