package dk.ek.shift_happens.employee.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class EmployeeNeo4jService {

    private final EmployeeNeo4jRepository employeeNeo4jRepository;

    public List<EmployeeNode> findAll() {
        return employeeNeo4jRepository.findAll();
    }

    public Optional<EmployeeNode> findById(Long id) {
        return employeeNeo4jRepository.findById(id);
    }
}
