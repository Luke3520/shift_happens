package dk.ek.shift_happens.leaveledger;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class LeaveLedgerService {

    private final LeaveLedgerRepository leaveLedgerRepository;

    public List<LeaveLedger> findAll() {
        return leaveLedgerRepository.findAll();
    }

    public List<LeaveLedger> findByEmployeeId(Integer employeeId) {
        return leaveLedgerRepository.findByEmployeeId(employeeId);
    }

    public Optional<LeaveLedger> findById(Integer id) {
        return leaveLedgerRepository.findById(id);
    }

    public LeaveLedger create(LeaveLedger leaveLedger) {
        return leaveLedgerRepository.save(leaveLedger);
    }

    public Optional<LeaveLedger> update(Integer id, LeaveLedger updates) {
        return leaveLedgerRepository.findById(id).map(existing -> {
            existing.setEmployeeId(updates.getEmployeeId());
            existing.setLeaveTypeId(updates.getLeaveTypeId());
            existing.setChangeAmountDays(updates.getChangeAmountDays());
            existing.setTransactionType(updates.getTransactionType());
            existing.setReferenceEntityType(updates.getReferenceEntityType());
            existing.setReferenceEntityId(updates.getReferenceEntityId());
            existing.setTransactionDatetime(updates.getTransactionDatetime());
            return leaveLedgerRepository.save(existing);
        });
    }

    public void delete(Integer id) {
        leaveLedgerRepository.deleteById(id);
    }
}
