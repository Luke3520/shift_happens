package dk.ek.shift_happens.leaverequest.neo4j;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Tag(name = "Neo4j - Leave Requests")
@RestController
@RequestMapping("/neo4j/leave-requests")
@RequiredArgsConstructor
public class LeaveRequestNeo4jController {

    private final LeaveRequestNeo4jService leaveRequestNeo4jService;

    @GetMapping
    public List<LeaveRequestNodeDto> getAll() {
        return leaveRequestNeo4jService.findAll().stream().map(LeaveRequestNodeDto::from).toList();
    }

    @GetMapping("/{id}")
    public LeaveRequestNodeDto getById(@PathVariable Long id) {
        return leaveRequestNeo4jService.findById(id)
                .map(LeaveRequestNodeDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public LeaveRequestNodeDto create(@RequestBody LeaveRequestNodeDto node) {
        return LeaveRequestNodeDto.from(leaveRequestNeo4jService.create(node.toEntity()));
    }

    @PutMapping("/{id}")
    public LeaveRequestNodeDto update(@PathVariable Long id, @RequestBody LeaveRequestNodeDto node) {
        return leaveRequestNeo4jService.update(id, node.toEntity())
                .map(LeaveRequestNodeDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) {
        if (!leaveRequestNeo4jService.delete(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }
}
