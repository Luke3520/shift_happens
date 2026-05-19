package dk.ek.shift_happens.leaverequest;

import java.time.LocalDate;
import java.time.LocalDateTime;

public record LeaveRequestDto(
        Integer leaveRequestId,
        Integer employeeId,
        Integer leaveTypeId,
        LocalDate startDate,
        LocalDate endDate,
        String requestStatus,
        String reason,
        LocalDateTime requestedDatetime
) {
    public static LeaveRequestDto from(LeaveRequest r) {
        return new LeaveRequestDto(
                r.getLeaveRequestId(),
                r.getEmployeeId(),
                r.getLeaveTypeId(),
                r.getStartDate(),
                r.getEndDate(),
                r.getRequestStatus(),
                r.getReason(),
                r.getRequestedDatetime()
        );
    }

    public LeaveRequest toEntity() {
        LeaveRequest r = new LeaveRequest();
        r.setLeaveRequestId(leaveRequestId);
        r.setEmployeeId(employeeId);
        r.setLeaveTypeId(leaveTypeId);
        r.setStartDate(startDate);
        r.setEndDate(endDate);
        r.setRequestStatus(requestStatus);
        r.setReason(reason);
        r.setRequestedDatetime(requestedDatetime);
        return r;
    }
}
