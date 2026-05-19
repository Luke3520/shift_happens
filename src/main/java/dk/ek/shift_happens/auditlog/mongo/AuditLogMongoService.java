package dk.ek.shift_happens.auditlog.mongo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AuditLogMongoService {

    private final AuditLogMongoRepository auditLogMongoRepository;

    public List<AuditLogDocument> findAll() {
        return auditLogMongoRepository.findAll();
    }

    public Optional<AuditLogDocument> findById(String id) {
        return auditLogMongoRepository.findById(id);
    }

    public AuditLogDocument create(AuditLogDocument document) {
        return auditLogMongoRepository.save(document);
    }

    public Optional<AuditLogDocument> update(String id, AuditLogDocument document) {
        if (!auditLogMongoRepository.existsById(id)) {
            return Optional.empty();
        }
        document.setId(id);
        return Optional.of(auditLogMongoRepository.save(document));
    }

    public boolean delete(String id) {
        if (!auditLogMongoRepository.existsById(id)) {
            return false;
        }
        auditLogMongoRepository.deleteById(id);
        return true;
    }
}
