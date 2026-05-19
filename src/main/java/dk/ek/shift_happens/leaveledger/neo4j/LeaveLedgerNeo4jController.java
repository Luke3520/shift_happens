package dk.ek.shift_happens.leaveledger.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/neo4j/leave-ledgers")
@RequiredArgsConstructor
public class LeaveLedgerNeo4jController {

    private final LeaveLedgerNeo4jService leaveLedgerNeo4jService;

    @GetMapping
    public List<LeaveLedgerNodeDto> getAll() {
        return leaveLedgerNeo4jService.findAll().stream().map(LeaveLedgerNodeDto::from).toList();
    }

    @GetMapping("/{id}")
    public LeaveLedgerNodeDto getById(@PathVariable Long id) {
        return leaveLedgerNeo4jService.findById(id)
                .map(LeaveLedgerNodeDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public LeaveLedgerNodeDto create(@RequestBody LeaveLedgerNodeDto node) {
        return LeaveLedgerNodeDto.from(leaveLedgerNeo4jService.create(node.toEntity()));
    }

    @PutMapping("/{id}")
    public LeaveLedgerNodeDto update(@PathVariable Long id, @RequestBody LeaveLedgerNodeDto node) {
        return leaveLedgerNeo4jService.update(id, node.toEntity())
                .map(LeaveLedgerNodeDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) {
        if (!leaveLedgerNeo4jService.delete(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }
}
