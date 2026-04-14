package dk.ek.shift_happens.department;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping( "/departments")
public class DepartmentController {

    private final DepartmentRepository departmentRepository;
    private final DepartmentMongoRepository departmentMongoRepository;

    @Value("${app.storage:mysql}")
    private String storageType;

    public DepartmentController(DepartmentRepository departmentRepository, DepartmentMongoRepository departmentMongoRepository) {
        this.departmentRepository = departmentRepository;
        this.departmentMongoRepository = departmentMongoRepository;
    }

    @GetMapping
    public List<?> getDepartments() {
        if ("mongo".equalsIgnoreCase(storageType)) {
            return this.departmentMongoRepository.findAll();
        }
        return this.departmentRepository.findAll();
    }
}
