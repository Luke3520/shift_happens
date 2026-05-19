package dk.ek.shift_happens.shiftswap;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ShiftSwapService {

    private final ShiftSwapRepository shiftSwapRepository;

    public List<ShiftSwap> findAll() {
        return shiftSwapRepository.findAll();
    }

    public List<ShiftSwap> findByEmployee(Integer employeeId) {
        return shiftSwapRepository.findByEmployeeFromIdOrEmployeeToId(employeeId, employeeId);
    }

    public Optional<ShiftSwap> findById(Integer id) {
        return shiftSwapRepository.findById(id);
    }

    public ShiftSwap create(ShiftSwap shiftSwap) {
        return shiftSwapRepository.save(shiftSwap);
    }

    public Optional<ShiftSwap> update(Integer id, ShiftSwap updates) {
        return shiftSwapRepository.findById(id).map(existing -> {
            existing.setOriginalShiftAssignmentId(updates.getOriginalShiftAssignmentId());
            existing.setEmployeeFromId(updates.getEmployeeFromId());
            existing.setEmployeeToId(updates.getEmployeeToId());
            existing.setSwapStatus(updates.getSwapStatus());
            existing.setRequestDatetime(updates.getRequestDatetime());
            existing.setReason(updates.getReason());
            return shiftSwapRepository.save(existing);
        });
    }

    public void delete(Integer id) {
        shiftSwapRepository.deleteById(id);
    }
}
