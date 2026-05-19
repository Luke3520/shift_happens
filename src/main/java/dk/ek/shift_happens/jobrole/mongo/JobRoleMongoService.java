package dk.ek.shift_happens.jobrole.mongo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class JobRoleMongoService {

    private final JobRoleMongoRepository jobRoleMongoRepository;

    public List<JobRoleDocument> findAll() {
        return jobRoleMongoRepository.findAll();
    }

    public Optional<JobRoleDocument> findById(String id) {
        return jobRoleMongoRepository.findById(id);
    }

    public JobRoleDocument create(JobRoleDocument document) {
        return jobRoleMongoRepository.save(document);
    }

    public Optional<JobRoleDocument> update(String id, JobRoleDocument document) {
        if (!jobRoleMongoRepository.existsById(id)) {
            return Optional.empty();
        }
        document.setId(id);
        return Optional.of(jobRoleMongoRepository.save(document));
    }

    public boolean delete(String id) {
        if (!jobRoleMongoRepository.existsById(id)) {
            return false;
        }
        jobRoleMongoRepository.deleteById(id);
        return true;
    }
}
