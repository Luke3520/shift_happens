package dk.ek.shift_happens.shiftrequiredjobrole;

public record ShiftRequiredJobRoleDto(
        Integer shiftRequiredJobRoleId,
        Integer shiftId,
        Integer jobRoleId,
        Integer requiredEmployeeCount
) {
    public static ShiftRequiredJobRoleDto from(ShiftRequiredJobRole r) {
        return new ShiftRequiredJobRoleDto(
                r.getShiftRequiredJobRoleId(),
                r.getShiftId(),
                r.getJobRoleId(),
                r.getRequiredEmployeeCount()
        );
    }

    public ShiftRequiredJobRole toEntity() {
        ShiftRequiredJobRole r = new ShiftRequiredJobRole();
        r.setShiftRequiredJobRoleId(shiftRequiredJobRoleId);
        r.setShiftId(shiftId);
        r.setJobRoleId(jobRoleId);
        r.setRequiredEmployeeCount(requiredEmployeeCount);
        return r;
    }
}
