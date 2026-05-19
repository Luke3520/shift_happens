package dk.ek.shift_happens.leavetype.neo4j;

public record LeaveTypeNodeDto(
        Long id,
        Integer leaveTypeId,
        String leaveTypeName,
        String leaveTypeDescription,
        Boolean requiresApproval,
        Boolean isPaidLeave
) {
    public static LeaveTypeNodeDto from(LeaveTypeNode n) {
        return new LeaveTypeNodeDto(
                n.getId(),
                n.getLeaveTypeId(),
                n.getLeaveTypeName(),
                n.getLeaveTypeDescription(),
                n.getRequiresApproval(),
                n.getIsPaidLeave()
        );
    }

    public LeaveTypeNode toEntity() {
        LeaveTypeNode n = new LeaveTypeNode();
        n.setId(id);
        n.setLeaveTypeId(leaveTypeId);
        n.setLeaveTypeName(leaveTypeName);
        n.setLeaveTypeDescription(leaveTypeDescription);
        n.setRequiresApproval(requiresApproval);
        n.setIsPaidLeave(isPaidLeave);
        return n;
    }
}
