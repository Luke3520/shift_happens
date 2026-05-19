package dk.ek.shift_happens.shiftassignment;

import java.time.LocalDateTime;

public record ShiftAssignmentDto(
        Integer shiftAssignmentId,
        Integer shiftId,
        Integer employeeId,
        String assignmentStatus,
        LocalDateTime assignedDatetime,
        LocalDateTime checkInDatetime,
        LocalDateTime checkOutDatetime
) {
    public static ShiftAssignmentDto from(ShiftAssignment a) {
        return new ShiftAssignmentDto(
                a.getShiftAssignmentId(),
                a.getShiftId(),
                a.getEmployeeId(),
                a.getAssignmentStatus(),
                a.getAssignedDatetime(),
                a.getCheckInDatetime(),
                a.getCheckOutDatetime()
        );
    }

    public ShiftAssignment toEntity() {
        ShiftAssignment a = new ShiftAssignment();
        a.setShiftAssignmentId(shiftAssignmentId);
        a.setShiftId(shiftId);
        a.setEmployeeId(employeeId);
        a.setAssignmentStatus(assignmentStatus);
        a.setAssignedDatetime(assignedDatetime);
        a.setCheckInDatetime(checkInDatetime);
        a.setCheckOutDatetime(checkOutDatetime);
        return a;
    }
}
