package dk.ek.shift_happens.department;

public record DepartmentDto(
        Integer departmentId,
        String departmentName,
        Boolean isActive
) {
    public static DepartmentDto from(Department department) {
        return new DepartmentDto(
                department.getDepartmentId(),
                department.getDepartmentName(),
                department.getIsActive()
        );
    }

    public Department toEntity() {
        Department department = new Department();
        department.setDepartmentId(departmentId);
        department.setDepartmentName(departmentName);
        department.setIsActive(isActive);
        return department;
    }
}
