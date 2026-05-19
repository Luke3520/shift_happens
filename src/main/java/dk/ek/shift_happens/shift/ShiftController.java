package dk.ek.shift_happens.shift;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Tag(name = "Shifts")
@RestController
@RequestMapping("/shifts")
@RequiredArgsConstructor
public class ShiftController {

    private final ShiftService shiftService;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<ShiftDto> getShifts() {
        return this.shiftService.findAll().stream().map(ShiftDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public Optional<ShiftDto> getShiftById(@PathVariable Integer id) {
        return this.shiftService.findById(id).map(ShiftDto::from);
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftDto createShift(@RequestBody ShiftDto shift) {
        return ShiftDto.from(this.shiftService.create(shift.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftDto updateShift(@PathVariable Integer id, @RequestBody ShiftDto shiftDetails) {
        return this.shiftService.update(id, shiftDetails.toEntity())
                .map(ShiftDto::from)
                .orElseThrow();
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public void deleteShift(@PathVariable Integer id) {
        this.shiftService.delete(id);
    }
}
