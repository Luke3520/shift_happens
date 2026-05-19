package dk.ek.shift_happens.worklocation.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class WorkLocationNeo4jService {

    private final WorkLocationNeo4jRepository workLocationNeo4jRepository;

    public List<WorkLocationNode> findAll() {
        return workLocationNeo4jRepository.findAll();
    }

    public Optional<WorkLocationNode> findById(Long id) {
        return workLocationNeo4jRepository.findById(id);
    }
}
