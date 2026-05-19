package dk.ek.shift_happens.leaverequest.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class LeaveRequestNeo4jService {

    private final LeaveRequestNeo4jRepository leaveRequestNeo4jRepository;

    public List<LeaveRequestNode> findAll() {
        return leaveRequestNeo4jRepository.findAll();
    }

    public Optional<LeaveRequestNode> findById(Long id) {
        return leaveRequestNeo4jRepository.findById(id);
    }

    public LeaveRequestNode create(LeaveRequestNode node) {
        return leaveRequestNeo4jRepository.save(node);
    }

    public Optional<LeaveRequestNode> update(Long id, LeaveRequestNode node) {
        if (!leaveRequestNeo4jRepository.existsById(id)) {
            return Optional.empty();
        }
        node.setId(id);
        return Optional.of(leaveRequestNeo4jRepository.save(node));
    }

    public boolean delete(Long id) {
        if (!leaveRequestNeo4jRepository.existsById(id)) {
            return false;
        }
        leaveRequestNeo4jRepository.deleteById(id);
        return true;
    }
}
