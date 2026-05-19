package dk.ek.shift_happens.shift;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/shifts")
@RequiredArgsConstructor
public class ShiftController {

    private final ShiftRepository shiftRepository;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<ShiftDto> getShifts() {
        return this.shiftRepository.findAll().stream().map(ShiftDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public Optional<ShiftDto> getShiftById(@PathVariable Integer id) {
        return this.shiftRepository.findById(id).map(ShiftDto::from);
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftDto createShift(@RequestBody ShiftDto shift) {
        return ShiftDto.from(this.shiftRepository.save(shift.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftDto updateShift(@PathVariable Integer id, @RequestBody ShiftDto shiftDetails) {
        Shift shift = this.shiftRepository.findById(id).orElseThrow();
        shift.setDepartmentId(shiftDetails.departmentId());
        shift.setWorkLocationId(shiftDetails.workLocationId());
        shift.setShiftName(shiftDetails.shiftName());
        shift.setStartDatetime(shiftDetails.startDatetime());
        shift.setEndDatetime(shiftDetails.endDatetime());
        shift.setShiftStatus(shiftDetails.shiftStatus());
        return ShiftDto.from(this.shiftRepository.save(shift));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public void deleteShift(@PathVariable Integer id) {
        this.shiftRepository.deleteById(id);
    }
}
