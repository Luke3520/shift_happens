package dk.ek.shift_happens.leavetype.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class LeaveTypeNeo4jService {

    private final LeaveTypeNeo4jRepository leaveTypeNeo4jRepository;

    public List<LeaveTypeNode> findAll() {
        return leaveTypeNeo4jRepository.findAll();
    }

    public Optional<LeaveTypeNode> findById(Long id) {
        return leaveTypeNeo4jRepository.findById(id);
    }

    public LeaveTypeNode create(LeaveTypeNode node) {
        return leaveTypeNeo4jRepository.save(node);
    }

    public Optional<LeaveTypeNode> update(Long id, LeaveTypeNode node) {
        if (!leaveTypeNeo4jRepository.existsById(id)) {
            return Optional.empty();
        }
        node.setId(id);
        return Optional.of(leaveTypeNeo4jRepository.save(node));
    }

    public boolean delete(Long id) {
        if (!leaveTypeNeo4jRepository.existsById(id)) {
            return false;
        }
        leaveTypeNeo4jRepository.deleteById(id);
        return true;
    }
}
