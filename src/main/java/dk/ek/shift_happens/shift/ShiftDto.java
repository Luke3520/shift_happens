package dk.ek.shift_happens.shift;

import java.time.LocalDateTime;

public record ShiftDto(
        Integer shiftId,
        Integer departmentId,
        Integer workLocationId,
        String shiftName,
        LocalDateTime startDatetime,
        LocalDateTime endDatetime,
        String shiftStatus
) {
    public static ShiftDto from(Shift shift) {
        return new ShiftDto(
                shift.getShiftId(),
                shift.getDepartmentId(),
                shift.getWorkLocationId(),
                shift.getShiftName(),
                shift.getStartDatetime(),
                shift.getEndDatetime(),
                shift.getShiftStatus()
        );
    }

    public Shift toEntity() {
        Shift shift = new Shift();
        shift.setShiftId(shiftId);
        shift.setDepartmentId(departmentId);
        shift.setWorkLocationId(workLocationId);
        shift.setShiftName(shiftName);
        shift.setStartDatetime(startDatetime);
        shift.setEndDatetime(endDatetime);
        shift.setShiftStatus(shiftStatus);
        return shift;
    }
}
