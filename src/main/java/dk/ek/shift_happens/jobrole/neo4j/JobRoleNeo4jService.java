package dk.ek.shift_happens.jobrole.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class JobRoleNeo4jService {

    private final JobRoleNeo4jRepository jobRoleNeo4jRepository;

    public List<JobRoleNode> findAll() {
        return jobRoleNeo4jRepository.findAll();
    }

    public Optional<JobRoleNode> findById(Long id) {
        return jobRoleNeo4jRepository.findById(id);
    }
}
