package dk.ek.shift_happens.leaveledger.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class LeaveLedgerNeo4jService {

    private final LeaveLedgerNeo4jRepository leaveLedgerNeo4jRepository;

    public List<LeaveLedgerNode> findAll() {
        return leaveLedgerNeo4jRepository.findAll();
    }

    public Optional<LeaveLedgerNode> findById(Long id) {
        return leaveLedgerNeo4jRepository.findById(id);
    }

    public LeaveLedgerNode create(LeaveLedgerNode node) {
        return leaveLedgerNeo4jRepository.save(node);
    }

    public Optional<LeaveLedgerNode> update(Long id, LeaveLedgerNode node) {
        if (!leaveLedgerNeo4jRepository.existsById(id)) {
            return Optional.empty();
        }
        node.setId(id);
        return Optional.of(leaveLedgerNeo4jRepository.save(node));
    }

    public boolean delete(Long id) {
        if (!leaveLedgerNeo4jRepository.existsById(id)) {
            return false;
        }
        leaveLedgerNeo4jRepository.deleteById(id);
        return true;
    }
}
