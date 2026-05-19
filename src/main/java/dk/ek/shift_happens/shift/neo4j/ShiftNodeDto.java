package dk.ek.shift_happens.shift.neo4j;

import java.time.LocalDateTime;

public record ShiftNodeDto(
        Long id,
        Integer shiftId,
        String shiftName,
        LocalDateTime startDatetime,
        LocalDateTime endDatetime,
        String shiftStatus
) {
    public static ShiftNodeDto from(ShiftNode n) {
        return new ShiftNodeDto(
                n.getId(),
                n.getShiftId(),
                n.getShiftName(),
                n.getStartDatetime(),
                n.getEndDatetime(),
                n.getShiftStatus()
        );
    }
}
