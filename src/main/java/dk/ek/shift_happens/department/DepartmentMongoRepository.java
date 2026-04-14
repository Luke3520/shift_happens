package dk.ek.shift_happens.department;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentMongoRepository extends MongoRepository<DepartmentMongo, String> {
    List<DepartmentMongo> findAll();
}
