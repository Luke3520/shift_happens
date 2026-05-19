package dk.ek.shift_happens.worklocation;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class WorkLocationService {

    private final WorkLocationRepository workLocationRepository;

    public List<WorkLocation> findAll() {
        return workLocationRepository.findAll();
    }

    public Optional<WorkLocation> findById(Integer id) {
        return workLocationRepository.findById(id);
    }

    public WorkLocation create(WorkLocation workLocation) {
        return workLocationRepository.save(workLocation);
    }

    public Optional<WorkLocation> update(Integer id, WorkLocation updates) {
        return workLocationRepository.findById(id).map(existing -> {
            existing.setLocationName(updates.getLocationName());
            existing.setAddressLine1(updates.getAddressLine1());
            existing.setAddressLine2(updates.getAddressLine2());
            existing.setCity(updates.getCity());
            existing.setCountry(updates.getCountry());
            existing.setTimezone(updates.getTimezone());
            existing.setIsActive(updates.getIsActive());
            return workLocationRepository.save(existing);
        });
    }

    public void delete(Integer id) {
        workLocationRepository.deleteById(id);
    }
}
