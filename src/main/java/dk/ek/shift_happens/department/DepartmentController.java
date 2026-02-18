package dk.ek.shift_happens.department;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Getter
@Setter
@RestController
@RequestMapping( "/departments")
public class DepartmentController {

    private final DepartmentRepository DepartmentRepository;

    public DepartmentController(DepartmentRepository departmentRepository) {
        this.DepartmentRepository = departmentRepository;
    }
    @GetMapping
    public List<Department> getDepartments() {
        return this.DepartmentRepository.findAll();
    }
}
