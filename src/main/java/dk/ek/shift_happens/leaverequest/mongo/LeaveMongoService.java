package dk.ek.shift_happens.leaverequest.mongo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class LeaveMongoService {

    private final LeaveMongoRepository leaveMongoRepository;

    public List<LeaveDocument> findAll() {
        return leaveMongoRepository.findAll();
    }

    public Optional<LeaveDocument> findById(String id) {
        return leaveMongoRepository.findById(id);
    }

    public LeaveDocument create(LeaveDocument document) {
        return leaveMongoRepository.save(document);
    }

    public Optional<LeaveDocument> update(String id, LeaveDocument document) {
        if (!leaveMongoRepository.existsById(id)) {
            return Optional.empty();
        }
        document.setId(id);
        return Optional.of(leaveMongoRepository.save(document));
    }

    public boolean delete(String id) {
        if (!leaveMongoRepository.existsById(id)) {
            return false;
        }
        leaveMongoRepository.deleteById(id);
        return true;
    }
}
