package dk.ek.shift_happens.employee.neo4j;

import java.time.LocalDate;

public record EmployeeNodeDto(
        Long id,
        Integer employeeId,
        String employeeNumber,
        String firstName,
        String lastName,
        String email,
        String userRole,
        String phoneNumber,
        LocalDate hireDate,
        String employmentStatus,
        Integer primaryWorkLocationId
) {
    public static EmployeeNodeDto from(EmployeeNode n) {
        return new EmployeeNodeDto(
                n.getId(),
                n.getEmployeeId(),
                n.getEmployeeNumber(),
                n.getFirstName(),
                n.getLastName(),
                n.getEmail(),
                n.getUserRole(),
                n.getPhoneNumber(),
                n.getHireDate(),
                n.getEmploymentStatus(),
                n.getPrimaryWorkLocationId()
        );
    }
}
