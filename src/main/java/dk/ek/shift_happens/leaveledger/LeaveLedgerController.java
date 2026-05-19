package dk.ek.shift_happens.leaveledger;

import dk.ek.shift_happens.auth.AuthHelper;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Tag(name = "Leave Ledger")
@RestController
@RequestMapping("/leaveledgers")
@RequiredArgsConstructor
public class LeaveLedgerController {

    private final LeaveLedgerService leaveLedgerService;
    private final AuthHelper authHelper;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<LeaveLedgerDto> getAll(Authentication auth) {
        List<LeaveLedger> ledgers = authHelper.isEmployee(auth)
                ? leaveLedgerService.findByEmployeeId(authHelper.currentEmployeeId(auth))
                : leaveLedgerService.findAll();
        return ledgers.stream().map(LeaveLedgerDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public LeaveLedgerDto getById(@PathVariable Integer id, Authentication auth) {
        LeaveLedger ledger = leaveLedgerService.findById(id)
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
        return LeaveLedgerDto.from(leaveLedgerService.create(ledger.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public LeaveLedgerDto update(@PathVariable Integer id, @RequestBody LeaveLedgerDto details) {
        return leaveLedgerService.update(id, details.toEntity())
                .map(LeaveLedgerDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) {
        leaveLedgerService.delete(id);
    }
}
