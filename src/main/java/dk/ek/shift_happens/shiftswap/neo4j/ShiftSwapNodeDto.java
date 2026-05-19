package dk.ek.shift_happens.shiftswap.neo4j;

import java.time.LocalDateTime;

public record ShiftSwapNodeDto(
        Long id,
        Integer shiftSwapId,
        Integer originalShiftAssignmentId,
        Integer employeeFromId,
        Integer employeeToId,
        String swapStatus,
        LocalDateTime requestDatetime,
        String reason
) {
    public static ShiftSwapNodeDto from(ShiftSwapNode n) {
        return new ShiftSwapNodeDto(
                n.getId(),
                n.getShiftSwapId(),
                n.getOriginalShiftAssignmentId(),
                n.getEmployeeFromId(),
                n.getEmployeeToId(),
                n.getSwapStatus(),
                n.getRequestDatetime(),
                n.getReason()
        );
    }
}
