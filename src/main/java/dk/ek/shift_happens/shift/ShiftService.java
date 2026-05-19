package dk.ek.shift_happens.shift;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ShiftService {

    private final ShiftRepository shiftRepository;

    public List<Shift> findAll() {
        return shiftRepository.findAll();
    }

    public Optional<Shift> findById(Integer id) {
        return shiftRepository.findById(id);
    }

    public Shift create(Shift shift) {
        return shiftRepository.save(shift);
    }

    public Optional<Shift> update(Integer id, Shift updates) {
        return shiftRepository.findById(id).map(existing -> {
            existing.setDepartmentId(updates.getDepartmentId());
            existing.setWorkLocationId(updates.getWorkLocationId());
            existing.setShiftName(updates.getShiftName());
            existing.setStartDatetime(updates.getStartDatetime());
            existing.setEndDatetime(updates.getEndDatetime());
            existing.setShiftStatus(updates.getShiftStatus());
            return shiftRepository.save(existing);
        });
    }

    public void delete(Integer id) {
        shiftRepository.deleteById(id);
    }
}
