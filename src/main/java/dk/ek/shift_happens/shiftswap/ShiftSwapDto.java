package dk.ek.shift_happens.shiftswap;

import java.time.LocalDateTime;

public record ShiftSwapDto(
        Integer shiftSwapId,
        Integer originalShiftAssignmentId,
        Integer employeeFromId,
        Integer employeeToId,
        String swapStatus,
        LocalDateTime requestDatetime,
        String reason
) {
    public static ShiftSwapDto from(ShiftSwap s) {
        return new ShiftSwapDto(
                s.getShiftSwapId(),
                s.getOriginalShiftAssignmentId(),
                s.getEmployeeFromId(),
                s.getEmployeeToId(),
                s.getSwapStatus(),
                s.getRequestDatetime(),
                s.getReason()
        );
    }

    public ShiftSwap toEntity() {
        ShiftSwap s = new ShiftSwap();
        s.setShiftSwapId(shiftSwapId);
        s.setOriginalShiftAssignmentId(originalShiftAssignmentId);
        s.setEmployeeFromId(employeeFromId);
        s.setEmployeeToId(employeeToId);
        s.setSwapStatus(swapStatus);
        s.setRequestDatetime(requestDatetime);
        s.setReason(reason);
        return s;
    }
}
