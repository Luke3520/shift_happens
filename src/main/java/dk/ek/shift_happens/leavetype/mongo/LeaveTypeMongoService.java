package dk.ek.shift_happens.leavetype.mongo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class LeaveTypeMongoService {

    private final LeaveTypeMongoRepository leaveTypeMongoRepository;

    public List<LeaveTypeDocument> findAll() {
        return leaveTypeMongoRepository.findAll();
    }

    public Optional<LeaveTypeDocument> findById(String id) {
        return leaveTypeMongoRepository.findById(id);
    }

    public LeaveTypeDocument create(LeaveTypeDocument document) {
        return leaveTypeMongoRepository.save(document);
    }

    public Optional<LeaveTypeDocument> update(String id, LeaveTypeDocument document) {
        if (!leaveTypeMongoRepository.existsById(id)) {
            return Optional.empty();
        }
        document.setId(id);
        return Optional.of(leaveTypeMongoRepository.save(document));
    }

    public boolean delete(String id) {
        if (!leaveTypeMongoRepository.existsById(id)) {
            return false;
        }
        leaveTypeMongoRepository.deleteById(id);
        return true;
    }
}
