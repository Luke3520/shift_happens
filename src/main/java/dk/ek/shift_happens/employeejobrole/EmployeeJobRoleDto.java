package dk.ek.shift_happens.employeejobrole;

import java.time.LocalDate;

public record EmployeeJobRoleDto(
        Integer employeeJobRoleId,
        Integer employeeId,
        Integer jobRoleId,
        LocalDate assignedDate,
        LocalDate expiryDate,
        String proficiencyLevel
) {
    public static EmployeeJobRoleDto from(EmployeeJobRole r) {
        return new EmployeeJobRoleDto(
                r.getEmployeeJobRoleId(),
                r.getEmployeeId(),
                r.getJobRoleId(),
                r.getAssignedDate(),
                r.getExpiryDate(),
                r.getProficiencyLevel()
        );
    }

    public EmployeeJobRole toEntity() {
        EmployeeJobRole r = new EmployeeJobRole();
        r.setEmployeeJobRoleId(employeeJobRoleId);
        r.setEmployeeId(employeeId);
        r.setJobRoleId(jobRoleId);
        r.setAssignedDate(assignedDate);
        r.setExpiryDate(expiryDate);
        r.setProficiencyLevel(proficiencyLevel);
        return r;
    }
}
