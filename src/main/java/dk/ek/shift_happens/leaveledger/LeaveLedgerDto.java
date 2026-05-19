package dk.ek.shift_happens.leaveledger;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public record LeaveLedgerDto(
        Integer leaveLedgerId,
        Integer employeeId,
        Integer leaveTypeId,
        BigDecimal changeAmountDays,
        String transactionType,
        String referenceEntityType,
        Integer referenceEntityId,
        LocalDateTime transactionDatetime
) {
    public static LeaveLedgerDto from(LeaveLedger l) {
        return new LeaveLedgerDto(
                l.getLeaveLedgerId(),
                l.getEmployeeId(),
                l.getLeaveTypeId(),
                l.getChangeAmountDays(),
                l.getTransactionType(),
                l.getReferenceEntityType(),
                l.getReferenceEntityId(),
                l.getTransactionDatetime()
        );
    }

    public LeaveLedger toEntity() {
        LeaveLedger l = new LeaveLedger();
        l.setLeaveLedgerId(leaveLedgerId);
        l.setEmployeeId(employeeId);
        l.setLeaveTypeId(leaveTypeId);
        l.setChangeAmountDays(changeAmountDays);
        l.setTransactionType(transactionType);
        l.setReferenceEntityType(referenceEntityType);
        l.setReferenceEntityId(referenceEntityId);
        l.setTransactionDatetime(transactionDatetime);
        return l;
    }
}
