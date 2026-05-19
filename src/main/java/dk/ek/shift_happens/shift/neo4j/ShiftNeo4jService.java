package dk.ek.shift_happens.shift.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ShiftNeo4jService {

    private final ShiftNeo4jRepository shiftNeo4jRepository;

    public List<ShiftNode> findAll() {
        return shiftNeo4jRepository.findAll();
    }

    public Optional<ShiftNode> findById(Long id) {
        return shiftNeo4jRepository.findById(id);
    }
}
