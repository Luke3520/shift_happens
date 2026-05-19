package dk.ek.shift_happens.department.mongo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class DepartmentMongoService {

    private final DepartmentMongoRepository departmentMongoRepository;

    public List<DepartmentDocument> findAll() {
        return departmentMongoRepository.findAll();
    }

    public Optional<DepartmentDocument> findById(String id) {
        return departmentMongoRepository.findById(id);
    }

    public DepartmentDocument create(DepartmentDocument document) {
        return departmentMongoRepository.save(document);
    }

    public Optional<DepartmentDocument> update(String id, DepartmentDocument document) {
        if (!departmentMongoRepository.existsById(id)) {
            return Optional.empty();
        }
        document.setId(id);
        return Optional.of(departmentMongoRepository.save(document));
    }

    public boolean delete(String id) {
        if (!departmentMongoRepository.existsById(id)) {
            return false;
        }
        departmentMongoRepository.deleteById(id);
        return true;
    }
}
