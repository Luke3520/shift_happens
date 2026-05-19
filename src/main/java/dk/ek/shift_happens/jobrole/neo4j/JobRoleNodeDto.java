package dk.ek.shift_happens.jobrole.neo4j;

public record JobRoleNodeDto(
        Long id,
        Integer jobRoleId,
        String roleName,
        String jobRoleDescription,
        Boolean isCertificationRequired
) {
    public static JobRoleNodeDto from(JobRoleNode n) {
        return new JobRoleNodeDto(
                n.getId(),
                n.getJobRoleId(),
                n.getRoleName(),
                n.getJobRoleDescription(),
                n.getIsCertificationRequired()
        );
    }
}
