package dk.ek.shift_happens.leavetype;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class LeaveTypeService {

    private final LeaveTypeRepository leaveTypeRepository;

    public List<LeaveType> findAll() {
        return leaveTypeRepository.findAll();
    }

    public Optional<LeaveType> findById(Integer id) {
        return leaveTypeRepository.findById(id);
    }

    public LeaveType create(LeaveType leaveType) {
        return leaveTypeRepository.save(leaveType);
    }

    public Optional<LeaveType> update(Integer id, LeaveType updates) {
        return leaveTypeRepository.findById(id).map(existing -> {
            existing.setLeaveTypeName(updates.getLeaveTypeName());
            existing.setLeaveTypeDescription(updates.getLeaveTypeDescription());
            existing.setRequiresApproval(updates.getRequiresApproval());
            existing.setIsPaidLeave(updates.getIsPaidLeave());
            return leaveTypeRepository.save(existing);
        });
    }

    public void delete(Integer id) {
        leaveTypeRepository.deleteById(id);
    }
}
