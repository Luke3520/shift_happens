package dk.ek.shift_happens.leavetype.mongo;

public record LeaveTypeDocumentDto(
        String id,
        Integer leaveTypeId,
        String leaveTypeName,
        String leaveTypeDescription,
        Boolean requiresApproval,
        Boolean isPaidLeave
) {
    public static LeaveTypeDocumentDto from(LeaveTypeDocument l) {
        return new LeaveTypeDocumentDto(
                l.getId(),
                l.getLeaveTypeId(),
                l.getLeaveTypeName(),
                l.getLeaveTypeDescription(),
                l.getRequiresApproval(),
                l.getIsPaidLeave()
        );
    }

    public LeaveTypeDocument toEntity() {
        LeaveTypeDocument l = new LeaveTypeDocument();
        l.setId(id);
        l.setLeaveTypeId(leaveTypeId);
        l.setLeaveTypeName(leaveTypeName);
        l.setLeaveTypeDescription(leaveTypeDescription);
        l.setRequiresApproval(requiresApproval);
        l.setIsPaidLeave(isPaidLeave);
        return l;
    }
}
