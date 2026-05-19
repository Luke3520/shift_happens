package dk.ek.shift_happens.leaveledger.neo4j;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public record LeaveLedgerNodeDto(
        Long id,
        Integer leaveLedgerId,
        Integer employeeId,
        Integer leaveTypeId,
        BigDecimal changeAmountDays,
        String transactionType,
        String referenceEntityType,
        Integer referenceEntityId,
        LocalDateTime transactionDatetime
) {
    public static LeaveLedgerNodeDto from(LeaveLedgerNode n) {
        return new LeaveLedgerNodeDto(
                n.getId(),
                n.getLeaveLedgerId(),
                n.getEmployeeId(),
                n.getLeaveTypeId(),
                n.getChangeAmountDays(),
                n.getTransactionType(),
                n.getReferenceEntityType(),
                n.getReferenceEntityId(),
                n.getTransactionDatetime()
        );
    }

    public LeaveLedgerNode toEntity() {
        LeaveLedgerNode n = new LeaveLedgerNode();
        n.setId(id);
        n.setLeaveLedgerId(leaveLedgerId);
        n.setEmployeeId(employeeId);
        n.setLeaveTypeId(leaveTypeId);
        n.setChangeAmountDays(changeAmountDays);
        n.setTransactionType(transactionType);
        n.setReferenceEntityType(referenceEntityType);
        n.setReferenceEntityId(referenceEntityId);
        n.setTransactionDatetime(transactionDatetime);
        return n;
    }
}
