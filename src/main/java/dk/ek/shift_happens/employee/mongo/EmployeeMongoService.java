package dk.ek.shift_happens.employee.mongo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class EmployeeMongoService {

    private final EmployeeMongoRepository employeeMongoRepository;

    public List<EmployeeDocument> findAll() {
        return employeeMongoRepository.findAll();
    }

    public Optional<EmployeeDocument> findById(Integer id) {
        return employeeMongoRepository.findById(id);
    }

    public EmployeeDocument create(EmployeeDocument document) {
        return employeeMongoRepository.save(document);
    }

    public Optional<EmployeeDocument> update(Integer id, EmployeeDocument document) {
        if (!employeeMongoRepository.existsById(id)) {
            return Optional.empty();
        }
        document.setEmployeeId(id);
        return Optional.of(employeeMongoRepository.save(document));
    }

    public boolean delete(Integer id) {
        if (!employeeMongoRepository.existsById(id)) {
            return false;
        }
        employeeMongoRepository.deleteById(id);
        return true;
    }
}
