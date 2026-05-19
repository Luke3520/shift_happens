package dk.ek.shift_happens.shiftassignment;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ShiftAssignmentService {

    private final ShiftAssignmentRepository shiftAssignmentRepository;

    public List<ShiftAssignment> findAll() {
        return shiftAssignmentRepository.findAll();
    }

    public List<ShiftAssignment> findByEmployeeId(Integer employeeId) {
        return shiftAssignmentRepository.findByEmployeeId(employeeId);
    }

    public Optional<ShiftAssignment> findById(Integer id) {
        return shiftAssignmentRepository.findById(id);
    }

    public ShiftAssignment create(ShiftAssignment shiftAssignment) {
        return shiftAssignmentRepository.save(shiftAssignment);
    }

    public Optional<ShiftAssignment> update(Integer id, ShiftAssignment updates) {
        return shiftAssignmentRepository.findById(id).map(existing -> {
            existing.setShiftId(updates.getShiftId());
            existing.setEmployeeId(updates.getEmployeeId());
            existing.setAssignmentStatus(updates.getAssignmentStatus());
            existing.setAssignedDatetime(updates.getAssignedDatetime());
            existing.setCheckInDatetime(updates.getCheckInDatetime());
            existing.setCheckOutDatetime(updates.getCheckOutDatetime());
            return shiftAssignmentRepository.save(existing);
        });
    }

    public void delete(Integer id) {
        shiftAssignmentRepository.deleteById(id);
    }
}
