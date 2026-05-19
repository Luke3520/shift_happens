package dk.ek.shift_happens.auditlog;

import java.time.LocalDateTime;

public record AuditLogDto(
        Integer auditLogId,
        String entityType,
        Integer entityId,
        String actionType,
        String dbUser,
        LocalDateTime actionDatetime,
        String oldValueSnapshot,
        String newValueSnapshot
) {
    public static AuditLogDto from(AuditLog a) {
        return new AuditLogDto(
                a.getAuditLogId(),
                a.getEntityType(),
                a.getEntityId(),
                a.getActionType(),
                a.getDbUser(),
                a.getActionDatetime(),
                a.getOldValueSnapshot(),
                a.getNewValueSnapshot()
        );
    }
}
