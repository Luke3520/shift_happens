package dk.ek.shift_happens.shiftapproval;

import java.time.LocalDateTime;

public record ShiftApprovalDto(
        Integer shiftApprovalId,
        Integer shiftAssignmentId,
        Integer approverEmployeeId,
        String decision,
        String approvalComment,
        LocalDateTime decisionDatetime
) {
    public static ShiftApprovalDto from(ShiftApproval a) {
        return new ShiftApprovalDto(
                a.getShiftApprovalId(),
                a.getShiftAssignmentId(),
                a.getApproverEmployeeId(),
                a.getDecision(),
                a.getApprovalComment(),
                a.getDecisionDatetime()
        );
    }

    public ShiftApproval toEntity() {
        ShiftApproval a = new ShiftApproval();
        a.setShiftApprovalId(shiftApprovalId);
        a.setShiftAssignmentId(shiftAssignmentId);
        a.setApproverEmployeeId(approverEmployeeId);
        a.setDecision(decision);
        a.setApprovalComment(approvalComment);
        a.setDecisionDatetime(decisionDatetime);
        return a;
    }
}
