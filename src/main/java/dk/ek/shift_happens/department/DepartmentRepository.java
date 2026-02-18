package dk.ek.shift_happens.department;

import dk.ek.shift_happens.department.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentRepository extends JpaRepository<Department, Long> {
    // You can add custom queries here if needed
    List<Department> findAll();
}
