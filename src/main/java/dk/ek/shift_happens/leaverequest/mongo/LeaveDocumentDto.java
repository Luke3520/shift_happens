package dk.ek.shift_happens.leaverequest.mongo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.function.Function;

/**
 * DTO for {@link LeaveDocument}. Mirrors the document's nested structure with
 * nested records so the denormalised leave read model can be transferred
 * without exposing the persistence document itself.
 */
public record LeaveDocumentDto(
        String id,
        Integer employeeId,
        List<LeaveRequestRef> requests
) {
    public static LeaveDocumentDto from(LeaveDocument d) {
        return new LeaveDocumentDto(
                d.getId(),
                d.getEmployeeId(),
                mapList(d.getRequests(), LeaveRequestRef::from)
        );
    }

    public LeaveDocument toEntity() {
        LeaveDocument d = new LeaveDocument();
        d.setId(id);
        d.setEmployeeId(employeeId);
        d.setRequests(mapList(requests, LeaveRequestRef::toEntity));
        return d;
    }

    public record LeaveRequestRef(
            Integer leaveRequestId,
            Integer leaveTypeId,
            String leaveTypeName,
            LocalDate startDate,
            LocalDate endDate,
            String requestStatus,
            String reason,
            LocalDateTime requestedAt,
            List<ApprovalRef> approvals
    ) {
        static LeaveRequestRef from(LeaveDocument.LeaveRequestRef r) {
            if (r == null) return null;
            return new LeaveRequestRef(
                    r.getLeaveRequestId(),
                    r.getLeaveTypeId(),
                    r.getLeaveTypeName(),
                    r.getStartDate(),
                    r.getEndDate(),
                    r.getRequestStatus(),
                    r.getReason(),
                    r.getRequestedAt(),
                    mapList(r.getApprovals(), ApprovalRef::from)
            );
        }

        LeaveDocument.LeaveRequestRef toEntity() {
            LeaveDocument.LeaveRequestRef r = new LeaveDocument.LeaveRequestRef();
            r.setLeaveRequestId(leaveRequestId);
            r.setLeaveTypeId(leaveTypeId);
            r.setLeaveTypeName(leaveTypeName);
            r.setStartDate(startDate);
            r.setEndDate(endDate);
            r.setRequestStatus(requestStatus);
            r.setReason(reason);
            r.setRequestedAt(requestedAt);
            r.setApprovals(mapList(approvals, ApprovalRef::toEntity));
            return r;
        }
    }

    public record ApprovalRef(
            Integer approverEmployeeId,
            String decision,
            String comment,
            LocalDateTime decidedAt
    ) {
        static ApprovalRef from(LeaveDocument.ApprovalRef a) {
            if (a == null) return null;
            return new ApprovalRef(
                    a.getApproverEmployeeId(),
                    a.getDecision(),
                    a.getComment(),
                    a.getDecidedAt()
            );
        }

        LeaveDocument.ApprovalRef toEntity() {
            LeaveDocument.ApprovalRef a = new LeaveDocument.ApprovalRef();
            a.setApproverEmployeeId(approverEmployeeId);
            a.setDecision(decision);
            a.setComment(comment);
            a.setDecidedAt(decidedAt);
            return a;
        }
    }

    private static <S, T> List<T> mapList(List<S> src, Function<S, T> fn) {
        return src == null ? null : src.stream().map(fn).toList();
    }
}
