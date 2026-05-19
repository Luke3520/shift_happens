package dk.ek.shift_happens.worklocation.neo4j;

public record WorkLocationNodeDto(
        Long id,
        Integer workLocationId,
        String locationName,
        String city,
        String country,
        String timezone,
        Boolean isActive
) {
    public static WorkLocationNodeDto from(WorkLocationNode n) {
        return new WorkLocationNodeDto(
                n.getId(),
                n.getWorkLocationId(),
                n.getLocationName(),
                n.getCity(),
                n.getCountry(),
                n.getTimezone(),
                n.getIsActive()
        );
    }
}
