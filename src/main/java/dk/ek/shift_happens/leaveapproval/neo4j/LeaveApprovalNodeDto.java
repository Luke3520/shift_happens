package dk.ek.shift_happens.leaveapproval.neo4j;

import java.time.LocalDateTime;

public record LeaveApprovalNodeDto(
        Long id,
        Integer leaveApprovalId,
        Integer leaveRequestId,
        Integer approverEmployeeId,
        String decision,
        String leaveComment,
        LocalDateTime decisionDatetime
) {
    public static LeaveApprovalNodeDto from(LeaveApprovalNode n) {
        return new LeaveApprovalNodeDto(
                n.getId(),
                n.getLeaveApprovalId(),
                n.getLeaveRequestId(),
                n.getApproverEmployeeId(),
                n.getDecision(),
                n.getLeaveComment(),
                n.getDecisionDatetime()
        );
    }

    public LeaveApprovalNode toEntity() {
        LeaveApprovalNode n = new LeaveApprovalNode();
        n.setId(id);
        n.setLeaveApprovalId(leaveApprovalId);
        n.setLeaveRequestId(leaveRequestId);
        n.setApproverEmployeeId(approverEmployeeId);
        n.setDecision(decision);
        n.setLeaveComment(leaveComment);
        n.setDecisionDatetime(decisionDatetime);
        return n;
    }
}
