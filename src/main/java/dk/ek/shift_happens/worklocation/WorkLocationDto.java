package dk.ek.shift_happens.worklocation;

public record WorkLocationDto(
        Integer workLocationId,
        String locationName,
        String addressLine1,
        String addressLine2,
        String city,
        String country,
        String timezone,
        Boolean isActive
) {
    public static WorkLocationDto from(WorkLocation workLocation) {
        return new WorkLocationDto(
                workLocation.getWorkLocationId(),
                workLocation.getLocationName(),
                workLocation.getAddressLine1(),
                workLocation.getAddressLine2(),
                workLocation.getCity(),
                workLocation.getCountry(),
                workLocation.getTimezone(),
                workLocation.getIsActive()
        );
    }

    public WorkLocation toEntity() {
        WorkLocation workLocation = new WorkLocation();
        workLocation.setWorkLocationId(workLocationId);
        workLocation.setLocationName(locationName);
        workLocation.setAddressLine1(addressLine1);
        workLocation.setAddressLine2(addressLine2);
        workLocation.setCity(city);
        workLocation.setCountry(country);
        workLocation.setTimezone(timezone);
        workLocation.setIsActive(isActive);
        return workLocation;
    }
}
