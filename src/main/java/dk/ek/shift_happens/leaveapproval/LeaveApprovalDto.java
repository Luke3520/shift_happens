package dk.ek.shift_happens.leaveapproval;

import java.time.LocalDateTime;

public record LeaveApprovalDto(
        Integer leaveApprovalId,
        Integer leaveRequestId,
        Integer approverEmployeeId,
        String decision,
        String leaveComment,
        LocalDateTime decisionDatetime
) {
    public static LeaveApprovalDto from(LeaveApproval a) {
        return new LeaveApprovalDto(
                a.getLeaveApprovalId(),
                a.getLeaveRequestId(),
                a.getApproverEmployeeId(),
                a.getDecision(),
                a.getLeaveComment(),
                a.getDecisionDatetime()
        );
    }

    public LeaveApproval toEntity() {
        LeaveApproval a = new LeaveApproval();
        a.setLeaveApprovalId(leaveApprovalId);
        a.setLeaveRequestId(leaveRequestId);
        a.setApproverEmployeeId(approverEmployeeId);
        a.setDecision(decision);
        a.setLeaveComment(leaveComment);
        a.setDecisionDatetime(decisionDatetime);
        return a;
    }
}
