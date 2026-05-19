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

    private final ShiftApprovalRepository shiftApprovalRepository;

    @GetMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public List<ShiftApprovalDto> getShiftApprovals() {
        return this.shiftApprovalRepository.findAll().stream().map(ShiftApprovalDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public Optional<ShiftApprovalDto> getShiftApprovalById(@PathVariable Integer id) {
        return this.shiftApprovalRepository.findById(id).map(ShiftApprovalDto::from);
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftApprovalDto createShiftApproval(@RequestBody ShiftApprovalDto shiftApproval) {
        return ShiftApprovalDto.from(this.shiftApprovalRepository.save(shiftApproval.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public ShiftApprovalDto updateShiftApproval(@PathVariable Integer id, @RequestBody ShiftApprovalDto shiftApprovalDetails) {
        ShiftApproval shiftApproval = this.shiftApprovalRepository.findById(id).orElseThrow();
        shiftApproval.setShiftAssignmentId(shiftApprovalDetails.shiftAssignmentId());
        shiftApproval.setApproverEmployeeId(shiftApprovalDetails.approverEmployeeId());
        shiftApproval.setDecision(shiftApprovalDetails.decision());
        shiftApproval.setApprovalComment(shiftApprovalDetails.approvalComment());
        shiftApproval.setDecisionDatetime(shiftApprovalDetails.decisionDatetime());
        return ShiftApprovalDto.from(this.shiftApprovalRepository.save(shiftApproval));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public void deleteShiftApproval(@PathVariable Integer id) {
        this.shiftApprovalRepository.deleteById(id);
    }
}
