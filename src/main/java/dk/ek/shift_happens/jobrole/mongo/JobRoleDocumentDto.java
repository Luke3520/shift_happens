package dk.ek.shift_happens.jobrole.mongo;

public record JobRoleDocumentDto(
        String id,
        Integer jobRoleId,
        String roleName,
        String jobRoleDescription,
        Boolean isCertificationRequired
) {
    public static JobRoleDocumentDto from(JobRoleDocument j) {
        return new JobRoleDocumentDto(
                j.getId(),
                j.getJobRoleId(),
                j.getRoleName(),
                j.getJobRoleDescription(),
                j.getIsCertificationRequired()
        );
    }

    public JobRoleDocument toEntity() {
        JobRoleDocument j = new JobRoleDocument();
        j.setId(id);
        j.setJobRoleId(jobRoleId);
        j.setRoleName(roleName);
        j.setJobRoleDescription(jobRoleDescription);
        j.setIsCertificationRequired(isCertificationRequired);
        return j;
    }
}
