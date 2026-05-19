package dk.ek.shift_happens.employee.mongo;

import dk.ek.shift_happens.employee.UserRole;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class EmployeeMongoService {

    private final EmployeeMongoRepository employeeMongoRepository;
    private final MongoTemplate mongoTemplate;

    public List<EmployeeDocument> findAll() {
        return employeeMongoRepository.findAll();
    }

    public Page<EmployeeDocument> findAll(String employmentStatus, Integer primaryWorkLocationId, String userRole, String email, String firstName, String lastName, Pageable pageable) {
        Query query = new Query().with(pageable);
        if (employmentStatus != null) {
            query.addCriteria(Criteria.where("employmentStatus").is(employmentStatus));
        }
        if (primaryWorkLocationId != null) {
            query.addCriteria(Criteria.where("primaryWorkLocation.workLocationId").is(primaryWorkLocationId));
        }
        if (userRole != null) {
            query.addCriteria(Criteria.where("userRole").is(userRole));
        }
        if (email != null) {
            query.addCriteria(Criteria.where("email").regex(email, "i"));
        }
        if (firstName != null) {
            query.addCriteria(Criteria.where("firstName").regex(firstName, "i"));
        }
        if (lastName != null) {
            query.addCriteria(Criteria.where("lastName").regex(lastName, "i"));
        }

        long total = mongoTemplate.count(Query.of(query).limit(-1).skip(-1), EmployeeDocument.class);
        List<EmployeeDocument> list = mongoTemplate.find(query, EmployeeDocument.class);

        return new PageImpl<>(list, pageable, total);
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
