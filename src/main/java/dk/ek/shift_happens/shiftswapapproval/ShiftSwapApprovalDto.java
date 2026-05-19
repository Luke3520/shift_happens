package dk.ek.shift_happens.shiftswapapproval;

import java.time.LocalDateTime;

public record ShiftSwapApprovalDto(
        Integer shiftSwapApprovalId,
        Integer shiftSwapId,
        Integer approverEmployeeId,
        String decision,
        String shiftSwapComment,
        LocalDateTime decisionDatetime
) {
    public static ShiftSwapApprovalDto from(ShiftSwapApproval a) {
        return new ShiftSwapApprovalDto(
                a.getShiftSwapApprovalId(),
                a.getShiftSwapId(),
                a.getApproverEmployeeId(),
                a.getDecision(),
                a.getShiftSwapComment(),
                a.getDecisionDatetime()
        );
    }

    public ShiftSwapApproval toEntity() {
        ShiftSwapApproval a = new ShiftSwapApproval();
        a.setShiftSwapApprovalId(shiftSwapApprovalId);
        a.setShiftSwapId(shiftSwapId);
        a.setApproverEmployeeId(approverEmployeeId);
        a.setDecision(decision);
        a.setShiftSwapComment(shiftSwapComment);
        a.setDecisionDatetime(decisionDatetime);
        return a;
    }
}
