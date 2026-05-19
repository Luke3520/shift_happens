package dk.ek.shift_happens.leaveapproval.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/neo4j/leave-approvals")
@RequiredArgsConstructor
public class LeaveApprovalNeo4jController {

    private final LeaveApprovalNeo4jRepository leaveApprovalNeo4jRepository;

    @GetMapping
    public List<LeaveApprovalNodeDto> getAll() {
        return leaveApprovalNeo4jRepository.findAll().stream().map(LeaveApprovalNodeDto::from).toList();
    }

    @GetMapping("/{id}")
    public LeaveApprovalNodeDto getById(@PathVariable Long id) {
        return leaveApprovalNeo4jRepository.findById(id)
                .map(LeaveApprovalNodeDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public LeaveApprovalNodeDto create(@RequestBody LeaveApprovalNodeDto node) {
        return LeaveApprovalNodeDto.from(leaveApprovalNeo4jRepository.save(node.toEntity()));
    }

    @PutMapping("/{id}")
    public LeaveApprovalNodeDto update(@PathVariable Long id, @RequestBody LeaveApprovalNodeDto node) {
        if (!leaveApprovalNeo4jRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        LeaveApprovalNode entity = node.toEntity();
        entity.setId(id);
        return LeaveApprovalNodeDto.from(leaveApprovalNeo4jRepository.save(entity));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) {
        if (!leaveApprovalNeo4jRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        leaveApprovalNeo4jRepository.deleteById(id);
    }
}
