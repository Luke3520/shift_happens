package dk.ek.shift_happens.shiftapproval;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/shiftapprovals")
@RequiredArgsConstructor
public class ShiftApprovalController {

    private final ShiftApprovalService shiftApprovalService;

    @GetMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public List<ShiftApprovalDto> getShiftApprovals() {
        return this.shiftApprovalService.findAll().stream().map(ShiftApprovalDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public Optional<ShiftApprovalDto> getShiftApprovalById(@PathVariable Integer id) {
        return this.shiftApprovalService.findById(id).map(ShiftApprovalDto::from);
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftApprovalDto createShiftApproval(@RequestBody ShiftApprovalDto shiftApproval) {
        return ShiftApprovalDto.from(this.shiftApprovalService.create(shiftApproval.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftApprovalDto updateShiftApproval(@PathVariable Integer id, @RequestBody ShiftApprovalDto shiftApprovalDetails) {
        return this.shiftApprovalService.update(id, shiftApprovalDetails.toEntity())
                .map(ShiftApprovalDto::from)
                .orElseThrow();
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public void deleteShiftApproval(@PathVariable Integer id) {
        this.shiftApprovalService.delete(id);
    }
}
