package dk.ek.shift_happens.auditlog.mongo;

import java.time.LocalDateTime;

public record AuditLogDocumentDto(
        String id,
        String entityType,
        Integer entityId,
        String actionType,
        String dbUser,
        LocalDateTime actionDatetime,
        String oldValueSnapshot,
        String newValueSnapshot
) {
    public static AuditLogDocumentDto from(AuditLogDocument a) {
        return new AuditLogDocumentDto(
                a.getId(),
                a.getEntityType(),
                a.getEntityId(),
                a.getActionType(),
                a.getDbUser(),
                a.getActionDatetime(),
                a.getOldValueSnapshot(),
                a.getNewValueSnapshot()
        );
    }

    public AuditLogDocument toEntity() {
        AuditLogDocument a = new AuditLogDocument();
        a.setId(id);
        a.setEntityType(entityType);
        a.setEntityId(entityId);
        a.setActionType(actionType);
        a.setDbUser(dbUser);
        a.setActionDatetime(actionDatetime);
        a.setOldValueSnapshot(oldValueSnapshot);
        a.setNewValueSnapshot(newValueSnapshot);
        return a;
    }
}
