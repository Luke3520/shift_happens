package dk.ek.shift_happens.auditlog;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Tag(name = "Audit Logs")
@RestController
@RequestMapping("/auditlogs")
@RequiredArgsConstructor
public class AuditLogController {

    private final AuditLogService auditLogService;

    @GetMapping
    public List<AuditLogDto> getAuditLogs() {
        return this.auditLogService.findAll().stream().map(AuditLogDto::from).toList();
    }
}
