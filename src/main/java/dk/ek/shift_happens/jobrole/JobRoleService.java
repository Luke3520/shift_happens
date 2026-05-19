package dk.ek.shift_happens.jobrole;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class JobRoleService {

    private final JobRoleRepository jobRoleRepository;

    public List<JobRole> findAll() {
        return jobRoleRepository.findAll();
    }

    public Optional<JobRole> findById(Integer id) {
        return jobRoleRepository.findById(id);
    }

    public JobRole create(JobRole jobRole) {
        return jobRoleRepository.save(jobRole);
    }

    public Optional<JobRole> update(Integer id, JobRole updates) {
        return jobRoleRepository.findById(id).map(existing -> {
            existing.setRoleName(updates.getRoleName());
            existing.setJobRoleDescription(updates.getJobRoleDescription());
            existing.setIsCertificationRequired(updates.getIsCertificationRequired());
            return jobRoleRepository.save(existing);
        });
    }

    public void delete(Integer id) {
        jobRoleRepository.deleteById(id);
    }
}
