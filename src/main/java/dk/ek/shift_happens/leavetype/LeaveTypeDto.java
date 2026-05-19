package dk.ek.shift_happens.leavetype;

public record LeaveTypeDto(
        Integer leaveTypeId,
        String leaveTypeName,
        String leaveTypeDescription,
        Boolean requiresApproval,
        Boolean isPaidLeave
) {
    public static LeaveTypeDto from(LeaveType leaveType) {
        return new LeaveTypeDto(
                leaveType.getLeaveTypeId(),
                leaveType.getLeaveTypeName(),
                leaveType.getLeaveTypeDescription(),
                leaveType.getRequiresApproval(),
                leaveType.getIsPaidLeave()
        );
    }

    public LeaveType toEntity() {
        LeaveType leaveType = new LeaveType();
        leaveType.setLeaveTypeId(leaveTypeId);
        leaveType.setLeaveTypeName(leaveTypeName);
        leaveType.setLeaveTypeDescription(leaveTypeDescription);
        leaveType.setRequiresApproval(requiresApproval);
        leaveType.setIsPaidLeave(isPaidLeave);
        return leaveType;
    }
}
