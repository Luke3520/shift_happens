package dk.ek.shift_happens.shiftapproval;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ShiftApprovalService {

    private final ShiftApprovalRepository shiftApprovalRepository;

    public List<ShiftApproval> findAll() {
        return shiftApprovalRepository.findAll();
    }

    public Optional<ShiftApproval> findById(Integer id) {
        return shiftApprovalRepository.findById(id);
    }

    public ShiftApproval create(ShiftApproval shiftApproval) {
        return shiftApprovalRepository.save(shiftApproval);
    }

    public Optional<ShiftApproval> update(Integer id, ShiftApproval updates) {
        return shiftApprovalRepository.findById(id).map(existing -> {
            existing.setShiftAssignmentId(updates.getShiftAssignmentId());
            existing.setApproverEmployeeId(updates.getApproverEmployeeId());
            existing.setDecision(updates.getDecision());
            existing.setApprovalComment(updates.getApprovalComment());
            existing.setDecisionDatetime(updates.getDecisionDatetime());
            return shiftApprovalRepository.save(existing);
        });
    }

    public void delete(Integer id) {
        shiftApprovalRepository.deleteById(id);
    }
}
