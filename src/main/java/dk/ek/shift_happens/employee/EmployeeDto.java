package dk.ek.shift_happens.employee;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.time.LocalDate;

public record EmployeeDto(
        Integer employeeId,
        String employeeNumber,
        UserRole userRole,
        String firstName,
        String lastName,
        String email,
        // Accepted on create/update, never serialized back to clients.
        @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
        String loginPassword,
        String phoneNumber,
        LocalDate hireDate,
        String employmentStatus,
        Integer primaryWorkLocationId
) {
    public static EmployeeDto from(Employee e) {
        return new EmployeeDto(
                e.getEmployeeId(),
                e.getEmployeeNumber(),
                e.getUserRole(),
                e.getFirstName(),
                e.getLastName(),
                e.getEmail(),
                null,
                e.getPhoneNumber(),
                e.getHireDate(),
                e.getEmploymentStatus(),
                e.getPrimaryWorkLocationId()
        );
    }

    public Employee toEntity() {
        Employee e = new Employee();
        e.setEmployeeId(employeeId);
        e.setEmployeeNumber(employeeNumber);
        e.setUserRole(userRole);
        e.setFirstName(firstName);
        e.setLastName(lastName);
        e.setEmail(email);
        e.setLoginPassword(loginPassword);
        e.setPhoneNumber(phoneNumber);
        e.setHireDate(hireDate);
        e.setEmploymentStatus(employmentStatus);
        e.setPrimaryWorkLocationId(primaryWorkLocationId);
        return e;
    }
}
