package dk.ek.shift_happens.employeecontract;

import dk.ek.shift_happens.auth.AuthHelper;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Tag(name = "Employee Contracts")
@RestController
@RequestMapping("/employeecontracts")
@RequiredArgsConstructor
public class EmployeeContractController {

    private final EmployeeContractService employeeContractService;
    private final AuthHelper authHelper;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<EmployeeContractDto> getAll(Authentication auth) {
        List<EmployeeContract> contracts = authHelper.isEmployee(auth)
                ? employeeContractService.findByEmployeeId(authHelper.currentEmployeeId(auth))
                : employeeContractService.findAll();
        return contracts.stream().map(EmployeeContractDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public EmployeeContractDto getById(@PathVariable Integer id, Authentication auth) {
        EmployeeContract contract = employeeContractService.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));

        if (authHelper.isEmployee(auth)
                && !contract.getEmployeeId().equals(authHelper.currentEmployeeId(auth))) {
            throw authHelper.forbidden();
        }
        return EmployeeContractDto.from(contract);
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.CREATED)
    public EmployeeContractDto create(@RequestBody EmployeeContractDto contract) {
        return EmployeeContractDto.from(employeeContractService.create(contract.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public EmployeeContractDto update(@PathVariable Integer id, @RequestBody EmployeeContractDto details) {
        return employeeContractService.update(id, details.toEntity())
                .map(EmployeeContractDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) {
        employeeContractService.delete(id);
    }
}
