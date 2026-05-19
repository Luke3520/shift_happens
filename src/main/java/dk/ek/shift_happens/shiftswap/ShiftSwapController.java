package dk.ek.shift_happens.shiftswap;

import dk.ek.shift_happens.auth.AuthHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/shiftswaps")
@RequiredArgsConstructor
public class ShiftSwapController {

    private final ShiftSwapRepository shiftSwapRepository;
    private final AuthHelper authHelper;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<ShiftSwapDto> getShiftSwaps(Authentication auth) {
        List<ShiftSwap> swaps;
        if (authHelper.isEmployee(auth)) {
            Integer self = authHelper.currentEmployeeId(auth);
            swaps = shiftSwapRepository.findByEmployeeFromIdOrEmployeeToId(self, self);
        } else {
            swaps = this.shiftSwapRepository.findAll();
        }
        return swaps.stream().map(ShiftSwapDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public ShiftSwapDto getShiftSwapById(@PathVariable Integer id, Authentication auth) {
        ShiftSwap swap = shiftSwapRepository.findById(id)
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
        return ShiftSwapDto.from(this.shiftSwapRepository.save(shiftSwap.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftSwapDto updateShiftSwap(@PathVariable Integer id, @RequestBody ShiftSwapDto shiftSwapDetails) {
        ShiftSwap shiftSwap = this.shiftSwapRepository.findById(id).orElseThrow();
        shiftSwap.setOriginalShiftAssignmentId(shiftSwapDetails.originalShiftAssignmentId());
        shiftSwap.setEmployeeFromId(shiftSwapDetails.employeeFromId());
        shiftSwap.setEmployeeToId(shiftSwapDetails.employeeToId());
        shiftSwap.setSwapStatus(shiftSwapDetails.swapStatus());
        shiftSwap.setRequestDatetime(shiftSwapDetails.requestDatetime());
        shiftSwap.setReason(shiftSwapDetails.reason());
        return ShiftSwapDto.from(this.shiftSwapRepository.save(shiftSwap));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public void deleteShiftSwap(@PathVariable Integer id) {
        this.shiftSwapRepository.deleteById(id);
    }
}
