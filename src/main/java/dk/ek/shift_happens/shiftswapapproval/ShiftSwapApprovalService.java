package dk.ek.shift_happens.shiftswapapproval;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ShiftSwapApprovalService {

    private final ShiftSwapApprovalRepository shiftSwapApprovalRepository;

    public List<ShiftSwapApproval> findAll() {
        return shiftSwapApprovalRepository.findAll();
    }

    public Optional<ShiftSwapApproval> findById(Integer id) {
        return shiftSwapApprovalRepository.findById(id);
    }

    public ShiftSwapApproval create(ShiftSwapApproval shiftSwapApproval) {
        return shiftSwapApprovalRepository.save(shiftSwapApproval);
    }

    public Optional<ShiftSwapApproval> update(Integer id, ShiftSwapApproval updates) {
        return shiftSwapApprovalRepository.findById(id).map(existing -> {
            existing.setShiftSwapId(updates.getShiftSwapId());
            existing.setApproverEmployeeId(updates.getApproverEmployeeId());
            existing.setDecision(updates.getDecision());
            existing.setShiftSwapComment(updates.getShiftSwapComment());
            existing.setDecisionDatetime(updates.getDecisionDatetime());
            return shiftSwapApprovalRepository.save(existing);
        });
    }

    public void delete(Integer id) {
        shiftSwapApprovalRepository.deleteById(id);
    }
}
