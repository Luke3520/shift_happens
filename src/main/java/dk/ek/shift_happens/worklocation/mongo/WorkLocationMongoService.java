package dk.ek.shift_happens.worklocation.mongo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class WorkLocationMongoService {

    private final WorkLocationMongoRepository workLocationMongoRepository;

    public List<WorkLocationDocument> findAll() {
        return workLocationMongoRepository.findAll();
    }

    public Optional<WorkLocationDocument> findById(String id) {
        return workLocationMongoRepository.findById(id);
    }

    public WorkLocationDocument create(WorkLocationDocument document) {
        return workLocationMongoRepository.save(document);
    }

    public Optional<WorkLocationDocument> update(String id, WorkLocationDocument document) {
        if (!workLocationMongoRepository.existsById(id)) {
            return Optional.empty();
        }
        document.setId(id);
        return Optional.of(workLocationMongoRepository.save(document));
    }

    public boolean delete(String id) {
        if (!workLocationMongoRepository.existsById(id)) {
            return false;
        }
        workLocationMongoRepository.deleteById(id);
        return true;
    }
}
