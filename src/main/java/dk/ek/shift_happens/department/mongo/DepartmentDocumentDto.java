package dk.ek.shift_happens.department.mongo;

public record DepartmentDocumentDto(
        String id,
        Integer departmentId,
        String departmentName,
        Boolean isActive
) {
    public static DepartmentDocumentDto from(DepartmentDocument d) {
        return new DepartmentDocumentDto(
                d.getId(),
                d.getDepartmentId(),
                d.getDepartmentName(),
                d.getIsActive()
        );
    }

    public DepartmentDocument toEntity() {
        DepartmentDocument d = new DepartmentDocument();
        d.setId(id);
        d.setDepartmentId(departmentId);
        d.setDepartmentName(departmentName);
        d.setIsActive(isActive);
        return d;
    }
}
