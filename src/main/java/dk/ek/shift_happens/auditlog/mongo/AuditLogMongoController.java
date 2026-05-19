package dk.ek.shift_happens.auditlog.mongo;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/mongo/audit_log")
@RequiredArgsConstructor
public class AuditLogMongoController {

    private final AuditLogMongoRepository auditLogMongoRepository;

    @GetMapping
    public List<AuditLogDocumentDto> getAll() {
        return auditLogMongoRepository.findAll().stream().map(AuditLogDocumentDto::from).toList();
    }

    @GetMapping("/{id}")
    public AuditLogDocumentDto getById(@PathVariable String id) {
        return auditLogMongoRepository.findById(id)
                .map(AuditLogDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public AuditLogDocumentDto create(@RequestBody AuditLogDocumentDto auditLog) {
        return AuditLogDocumentDto.from(auditLogMongoRepository.save(auditLog.toEntity()));
    }

    @PutMapping("/{id}")
    public AuditLogDocumentDto update(@PathVariable String id, @RequestBody AuditLogDocumentDto auditLog) {
        if (!auditLogMongoRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        AuditLogDocument entity = auditLog.toEntity();
        entity.setId(id);
        return AuditLogDocumentDto.from(auditLogMongoRepository.save(entity));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable String id) {
        if (!auditLogMongoRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        auditLogMongoRepository.deleteById(id);
    }
}
