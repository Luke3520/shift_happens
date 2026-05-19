package dk.ek.shift_happens.jobrole;

public record JobRoleDto(
        Integer jobRoleId,
        String roleName,
        String jobRoleDescription,
        Boolean isCertificationRequired
) {
    public static JobRoleDto from(JobRole jobRole) {
        return new JobRoleDto(
                jobRole.getJobRoleId(),
                jobRole.getRoleName(),
                jobRole.getJobRoleDescription(),
                jobRole.getIsCertificationRequired()
        );
    }

    public JobRole toEntity() {
        JobRole jobRole = new JobRole();
        jobRole.setJobRoleId(jobRoleId);
        jobRole.setRoleName(roleName);
        jobRole.setJobRoleDescription(jobRoleDescription);
        jobRole.setIsCertificationRequired(isCertificationRequired);
        return jobRole;
    }
}
