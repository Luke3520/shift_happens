package dk.ek.shift_happens.leaveapproval.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class LeaveApprovalNeo4jService {

    private final LeaveApprovalNeo4jRepository leaveApprovalNeo4jRepository;

    public List<LeaveApprovalNode> findAll() {
        return leaveApprovalNeo4jRepository.findAll();
    }

    public Optional<LeaveApprovalNode> findById(Long id) {
        return leaveApprovalNeo4jRepository.findById(id);
    }

    public LeaveApprovalNode create(LeaveApprovalNode node) {
        return leaveApprovalNeo4jRepository.save(node);
    }

    public Optional<LeaveApprovalNode> update(Long id, LeaveApprovalNode node) {
        if (!leaveApprovalNeo4jRepository.existsById(id)) {
            return Optional.empty();
        }
        node.setId(id);
        return Optional.of(leaveApprovalNeo4jRepository.save(node));
    }

    public boolean delete(Long id) {
        if (!leaveApprovalNeo4jRepository.existsById(id)) {
            return false;
        }
        leaveApprovalNeo4jRepository.deleteById(id);
        return true;
    }
}
