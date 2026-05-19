package dk.ek.shift_happens.shiftrequiredjobrole;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ShiftRequiredJobRoleService {

    private final ShiftRequiredJobRoleRepository shiftRequiredJobRoleRepository;

    public List<ShiftRequiredJobRole> findAll() {
        return shiftRequiredJobRoleRepository.findAll();
    }

    public Optional<ShiftRequiredJobRole> findById(Integer id) {
        return shiftRequiredJobRoleRepository.findById(id);
    }

    public ShiftRequiredJobRole create(ShiftRequiredJobRole shiftRequiredJobRole) {
        return shiftRequiredJobRoleRepository.save(shiftRequiredJobRole);
    }

    public Optional<ShiftRequiredJobRole> update(Integer id, ShiftRequiredJobRole updates) {
        return shiftRequiredJobRoleRepository.findById(id).map(existing -> {
            existing.setShiftId(updates.getShiftId());
            existing.setJobRoleId(updates.getJobRoleId());
            existing.setRequiredEmployeeCount(updates.getRequiredEmployeeCount());
            return shiftRequiredJobRoleRepository.save(existing);
        });
    }

    public void delete(Integer id) {
        shiftRequiredJobRoleRepository.deleteById(id);
    }
}
