package dk.ek.shift_happens.employeecontract;

import java.time.LocalDate;

public record EmployeeContractDto(
        Integer contractId,
        Integer employeeId,
        Integer departmentId,
        String contractType,
        LocalDate startDate,
        LocalDate endDate,
        Integer weeklyHours,
        Boolean isActive
) {
    // salaryAmount is intentionally omitted: it is @JsonIgnore on the entity
    // and must not be exposed through the API.
    public static EmployeeContractDto from(EmployeeContract c) {
        return new EmployeeContractDto(
                c.getContractId(),
                c.getEmployeeId(),
                c.getDepartmentId(),
                c.getContractType(),
                c.getStartDate(),
                c.getEndDate(),
                c.getWeeklyHours(),
                c.getIsActive()
        );
    }

    public EmployeeContract toEntity() {
        EmployeeContract c = new EmployeeContract();
        c.setContractId(contractId);
        c.setEmployeeId(employeeId);
        c.setDepartmentId(departmentId);
        c.setContractType(contractType);
        c.setStartDate(startDate);
        c.setEndDate(endDate);
        c.setWeeklyHours(weeklyHours);
        c.setIsActive(isActive);
        return c;
    }
}
