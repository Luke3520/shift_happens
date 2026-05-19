package dk.ek.shift_happens.employeecontract;

import dk.ek.shift_happens.auth.AuthHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/employeecontracts")
@RequiredArgsConstructor
public class EmployeeContractController {

    private final EmployeeContractRepository employeeContractRepository;
    private final AuthHelper authHelper;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public List<EmployeeContractDto> getAll(Authentication auth) {
        List<EmployeeContract> contracts = authHelper.isEmployee(auth)
                ? employeeContractRepository.findByEmployeeId(authHelper.currentEmployeeId(auth))
                : employeeContractRepository.findAll();
        return contracts.stream().map(EmployeeContractDto::from).toList();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public EmployeeContractDto getById(@PathVariable Integer id, Authentication auth) {
        EmployeeContract contract = employeeContractRepository.findById(id)
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
        return EmployeeContractDto.from(employeeContractRepository.save(contract.toEntity()));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    public EmployeeContractDto update(@PathVariable Integer id, @RequestBody EmployeeContractDto details) {
        EmployeeContract existing = employeeContractRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        existing.setEmployeeId(details.employeeId());
        existing.setDepartmentId(details.departmentId());
        existing.setContractType(details.contractType());
        existing.setStartDate(details.startDate());
        existing.setEndDate(details.endDate());
        existing.setWeeklyHours(details.weeklyHours());
        // salaryAmount is not part of the DTO and is left untouched on update.
        existing.setIsActive(details.isActive());
        return EmployeeContractDto.from(employeeContractRepository.save(existing));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMINISTRATOR','MANAGER')")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) {
        employeeContractRepository.deleteById(id);
    }
}
