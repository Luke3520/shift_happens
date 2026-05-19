package dk.ek.shift_happens.shiftswap;

import dk.ek.shift_happens.auth.AuthHelper;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Tag(name = "Shift Swaps")
@RestController
@RequestMapping("/shiftswaps")
@RequiredArgsConstructor
public class ShiftSwapController {

    private final ShiftSwapService shiftSwapService;
    private final AuthHelper authHelper;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<ShiftSwapDto> getShiftSwaps(Authentication auth) {
        List<ShiftSwap> swaps;
        if (authHelper.isEmployee(auth)) {
            Integer self = authHelper.currentEmployeeId(auth);
            swaps = shiftSwapService.findByEmployee(self);
        } else {
            swaps = shiftSwapService.findAll();
        }
        return swaps.stream().map(ShiftSwapDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public ShiftSwapDto getShiftSwapById(@PathVariable Integer id, Authentication auth) {
        ShiftSwap swap = shiftSwapService.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        if (authHelper.isEmployee(auth)) {
            Integer self = authHelper.currentEmployeeId(auth);
            if (!self.equals(swap.getEmployeeFromId()) && !self.equals(swap.getEmployeeToId())) {
                throw authHelper.forbidden();
            }
        }
        return ShiftSwapDto.from(swap);
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftSwapDto createShiftSwap(@RequestBody ShiftSwapDto shiftSwap) {
        return ShiftSwapDto.from(shiftSwapService.create(shiftSwap.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftSwapDto updateShiftSwap(@PathVariable Integer id, @RequestBody ShiftSwapDto shiftSwapDetails) {
        return shiftSwapService.update(id, shiftSwapDetails.toEntity())
                .map(ShiftSwapDto::from)
                .orElseThrow();
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public void deleteShiftSwap(@PathVariable Integer id) {
        shiftSwapService.delete(id);
    }
}
