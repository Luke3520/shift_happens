package dk.ek.shift_happens.leaverequest.neo4j;

import java.time.LocalDate;
import java.time.LocalDateTime;

public record LeaveRequestNodeDto(
        Long id,
        Integer leaveRequestId,
        Integer employeeId,
        Integer leaveTypeId,
        LocalDate startDate,
        LocalDate endDate,
        String requestStatus,
        String reason,
        LocalDateTime requestedDatetime
) {
    public static LeaveRequestNodeDto from(LeaveRequestNode n) {
        return new LeaveRequestNodeDto(
                n.getId(),
                n.getLeaveRequestId(),
                n.getEmployeeId(),
                n.getLeaveTypeId(),
                n.getStartDate(),
                n.getEndDate(),
                n.getRequestStatus(),
                n.getReason(),
                n.getRequestedDatetime()
        );
    }

    public LeaveRequestNode toEntity() {
        LeaveRequestNode n = new LeaveRequestNode();
        n.setId(id);
        n.setLeaveRequestId(leaveRequestId);
        n.setEmployeeId(employeeId);
        n.setLeaveTypeId(leaveTypeId);
        n.setStartDate(startDate);
        n.setEndDate(endDate);
        n.setRequestStatus(requestStatus);
        n.setReason(reason);
        n.setRequestedDatetime(requestedDatetime);
        return n;
    }
}
