package dk.ek.shift_happens.shiftswapapproval;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Tag(name = "Shift Swap Approvals")
@RestController
@RequestMapping("/shiftswapapprovals")
@RequiredArgsConstructor
public class ShiftSwapApprovalController {

    private final ShiftSwapApprovalService shiftSwapApprovalService;

    @GetMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public List<ShiftSwapApprovalDto> getShiftSwapApprovals() {
        return this.shiftSwapApprovalService.findAll().stream().map(ShiftSwapApprovalDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public Optional<ShiftSwapApprovalDto> getShiftSwapApprovalById(@PathVariable Integer id) {
        return this.shiftSwapApprovalService.findById(id).map(ShiftSwapApprovalDto::from);
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftSwapApprovalDto createShiftSwapApproval(@RequestBody ShiftSwapApprovalDto shiftSwapApproval) {
        return ShiftSwapApprovalDto.from(this.shiftSwapApprovalService.create(shiftSwapApproval.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftSwapApprovalDto updateShiftSwapApproval(@PathVariable Integer id, @RequestBody ShiftSwapApprovalDto shiftSwapApprovalDetails) {
        return this.shiftSwapApprovalService.update(id, shiftSwapApprovalDetails.toEntity())
                .map(ShiftSwapApprovalDto::from)
                .orElseThrow();
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public void deleteShiftSwapApproval(@PathVariable Integer id) {
        this.shiftSwapApprovalService.delete(id);
    }
}
