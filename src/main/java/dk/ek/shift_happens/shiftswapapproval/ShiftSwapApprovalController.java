package dk.ek.shift_happens.shiftswapapproval;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/shiftswapapprovals")
@RequiredArgsConstructor
public class ShiftSwapApprovalController {

    private final ShiftSwapApprovalRepository shiftSwapApprovalRepository;

    @GetMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public List<ShiftSwapApprovalDto> getShiftSwapApprovals() {
        return this.shiftSwapApprovalRepository.findAll().stream().map(ShiftSwapApprovalDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public Optional<ShiftSwapApprovalDto> getShiftSwapApprovalById(@PathVariable Integer id) {
        return this.shiftSwapApprovalRepository.findById(id).map(ShiftSwapApprovalDto::from);
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftSwapApprovalDto createShiftSwapApproval(@RequestBody ShiftSwapApprovalDto shiftSwapApproval) {
        return ShiftSwapApprovalDto.from(this.shiftSwapApprovalRepository.save(shiftSwapApproval.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftSwapApprovalDto updateShiftSwapApproval(@PathVariable Integer id, @RequestBody ShiftSwapApprovalDto shiftSwapApprovalDetails) {
        ShiftSwapApproval shiftSwapApproval = this.shiftSwapApprovalRepository.findById(id).orElseThrow();
        shiftSwapApproval.setShiftSwapId(shiftSwapApprovalDetails.shiftSwapId());
        shiftSwapApproval.setApproverEmployeeId(shiftSwapApprovalDetails.approverEmployeeId());
        shiftSwapApproval.setDecision(shiftSwapApprovalDetails.decision());
        shiftSwapApproval.setShiftSwapComment(shiftSwapApprovalDetails.shiftSwapComment());
        shiftSwapApproval.setDecisionDatetime(shiftSwapApprovalDetails.decisionDatetime());
        return ShiftSwapApprovalDto.from(this.shiftSwapApprovalRepository.save(shiftSwapApproval));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public void deleteShiftSwapApproval(@PathVariable Integer id) {
        this.shiftSwapApprovalRepository.deleteById(id);
    }
}
