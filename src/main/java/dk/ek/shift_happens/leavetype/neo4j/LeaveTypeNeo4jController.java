package dk.ek.shift_happens.leavetype.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/neo4j/leave-types")
@RequiredArgsConstructor
public class LeaveTypeNeo4jController {

    private final LeaveTypeNeo4jService leaveTypeNeo4jService;

    @GetMapping
    public List<LeaveTypeNodeDto> getAll() {
        return leaveTypeNeo4jService.findAll().stream().map(LeaveTypeNodeDto::from).toList();
    }

    @GetMapping("/{id}")
    public LeaveTypeNodeDto getById(@PathVariable Long id) {
        return leaveTypeNeo4jService.findById(id)
                .map(LeaveTypeNodeDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public LeaveTypeNodeDto create(@RequestBody LeaveTypeNodeDto node) {
        return LeaveTypeNodeDto.from(leaveTypeNeo4jService.create(node.toEntity()));
    }

    @PutMapping("/{id}")
    public LeaveTypeNodeDto update(@PathVariable Long id, @RequestBody LeaveTypeNodeDto node) {
        return leaveTypeNeo4jService.update(id, node.toEntity())
                .map(LeaveTypeNodeDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) {
        if (!leaveTypeNeo4jService.delete(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }
}
