package dk.ek.shift_happens.worklocation.mongo;

public record WorkLocationDocumentDto(
        String id,
        Integer workLocationId,
        String locationName,
        String addressLine1,
        String addressLine2,
        String city,
        String country,
        String timezone,
        Boolean isActive
) {
    public static WorkLocationDocumentDto from(WorkLocationDocument w) {
        return new WorkLocationDocumentDto(
                w.getId(),
                w.getWorkLocationId(),
                w.getLocationName(),
                w.getAddressLine1(),
                w.getAddressLine2(),
                w.getCity(),
                w.getCountry(),
                w.getTimezone(),
                w.getIsActive()
        );
    }

    public WorkLocationDocument toEntity() {
        WorkLocationDocument w = new WorkLocationDocument();
        w.setId(id);
        w.setWorkLocationId(workLocationId);
        w.setLocationName(locationName);
        w.setAddressLine1(addressLine1);
        w.setAddressLine2(addressLine2);
        w.setCity(city);
        w.setCountry(country);
        w.setTimezone(timezone);
        w.setIsActive(isActive);
        return w;
    }
}
