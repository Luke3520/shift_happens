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

    private final AuditLogMongoService auditLogMongoService;

    @GetMapping
    public List<AuditLogDocumentDto> getAll() {
        return auditLogMongoService.findAll().stream().map(AuditLogDocumentDto::from).toList();
    }

    @GetMapping("/{id}")
    public AuditLogDocumentDto getById(@PathVariable String id) {
        return auditLogMongoService.findById(id)
                .map(AuditLogDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public AuditLogDocumentDto create(@RequestBody AuditLogDocumentDto auditLog) {
        return AuditLogDocumentDto.from(auditLogMongoService.create(auditLog.toEntity()));
    }

    @PutMapping("/{id}")
    public AuditLogDocumentDto update(@PathVariable String id, @RequestBody AuditLogDocumentDto auditLog) {
        return auditLogMongoService.update(id, auditLog.toEntity())
                .map(AuditLogDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable String id) {
        if (!auditLogMongoService.delete(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }
}
