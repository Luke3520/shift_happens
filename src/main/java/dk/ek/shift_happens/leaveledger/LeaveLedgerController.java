package dk.ek.shift_happens.leaveledger;

import dk.ek.shift_happens.auth.AuthHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/leaveledgers")
@RequiredArgsConstructor
public class LeaveLedgerController {

    private final LeaveLedgerRepository leaveLedgerRepository;
    private final AuthHelper authHelper;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<LeaveLedgerDto> getAll(Authentication auth) {
        List<LeaveLedger> ledgers = authHelper.isEmployee(auth)
                ? leaveLedgerRepository.findByEmployeeId(authHelper.currentEmployeeId(auth))
                : leaveLedgerRepository.findAll();
        return ledgers.stream().map(LeaveLedgerDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public LeaveLedgerDto getById(@PathVariable Integer id, Authentication auth) {
        LeaveLedger ledger = leaveLedgerRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));

        if (authHelper.isEmployee(auth)
                && !ledger.getEmployeeId().equals(authHelper.currentEmployeeId(auth))) {
            throw authHelper.forbidden();
        }
        return LeaveLedgerDto.from(ledger);
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.CREATED)
    public LeaveLedgerDto create(@RequestBody LeaveLedgerDto ledger) {
        return LeaveLedgerDto.from(leaveLedgerRepository.save(ledger.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public LeaveLedgerDto update(@PathVariable Integer id, @RequestBody LeaveLedgerDto details) {
        LeaveLedger existing = leaveLedgerRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        existing.setEmployeeId(details.employeeId());
        existing.setLeaveTypeId(details.leaveTypeId());
        existing.setChangeAmountDays(details.changeAmountDays());
        existing.setTransactionType(details.transactionType());
        existing.setReferenceEntityType(details.referenceEntityType());
        existing.setReferenceEntityId(details.referenceEntityId());
        existing.setTransactionDatetime(details.transactionDatetime());
        return LeaveLedgerDto.from(leaveLedgerRepository.save(existing));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) {
        leaveLedgerRepository.deleteById(id);
    }
}
