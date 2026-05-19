package dk.ek.shift_happens.department.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class DepartmentNeo4jService {

    private final DepartmentNeo4jRepository departmentNeo4jRepository;

    public List<DepartmentNode> findAll() {
        return departmentNeo4jRepository.findAll();
    }

    public Optional<DepartmentNode> findById(Long id) {
        return departmentNeo4jRepository.findById(id);
    }
}
