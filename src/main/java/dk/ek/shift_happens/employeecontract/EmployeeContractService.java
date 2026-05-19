package dk.ek.shift_happens.employeecontract;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class EmployeeContractService {

    private final EmployeeContractRepository employeeContractRepository;

    public List<EmployeeContract> findAll() {
        return employeeContractRepository.findAll();
    }

    public List<EmployeeContract> findByEmployeeId(Integer employeeId) {
        return employeeContractRepository.findByEmployeeId(employeeId);
    }

    public Optional<EmployeeContract> findById(Integer id) {
        return employeeContractRepository.findById(id);
    }

    public EmployeeContract create(EmployeeContract contract) {
        return employeeContractRepository.save(contract);
    }

    public Optional<EmployeeContract> update(Integer id, EmployeeContract updates) {
        return employeeContractRepository.findById(id).map(existing -> {
            existing.setEmployeeId(updates.getEmployeeId());
            existing.setDepartmentId(updates.getDepartmentId());
            existing.setContractType(updates.getContractType());
            existing.setStartDate(updates.getStartDate());
            existing.setEndDate(updates.getEndDate());
            existing.setWeeklyHours(updates.getWeeklyHours());
            // salaryAmount is intentionally not updated — it is not part of the DTO.
            existing.setIsActive(updates.getIsActive());
            return employeeContractRepository.save(existing);
        });
    }

    public void delete(Integer id) {
        employeeContractRepository.deleteById(id);
    }
}
