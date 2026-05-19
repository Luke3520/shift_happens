package dk.ek.shift_happens.department.neo4j;

public record DepartmentNodeDto(
        Long id,
        Integer departmentId,
        String departmentName,
        Boolean isActive
) {
    public static DepartmentNodeDto from(DepartmentNode n) {
        return new DepartmentNodeDto(
                n.getId(),
                n.getDepartmentId(),
                n.getDepartmentName(),
                n.getIsActive()
        );
    }
}
