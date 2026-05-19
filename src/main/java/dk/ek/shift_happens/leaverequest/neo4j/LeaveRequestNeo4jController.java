package dk.ek.shift_happens.leaverequest.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/neo4j/leave-requests")
@RequiredArgsConstructor
public class LeaveRequestNeo4jController {

    private final LeaveRequestNeo4jRepository leaveRequestNeo4jRepository;

    @GetMapping
    public List<LeaveRequestNodeDto> getAll() {
        return leaveRequestNeo4jRepository.findAll().stream().map(LeaveRequestNodeDto::from).toList();
    }

    @GetMapping("/{id}")
    public LeaveRequestNodeDto getById(@PathVariable Long id) {
        return leaveRequestNeo4jRepository.findById(id)
                .map(LeaveRequestNodeDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public LeaveRequestNodeDto create(@RequestBody LeaveRequestNodeDto node) {
        return LeaveRequestNodeDto.from(leaveRequestNeo4jRepository.save(node.toEntity()));
    }

    @PutMapping("/{id}")
    public LeaveRequestNodeDto update(@PathVariable Long id, @RequestBody LeaveRequestNodeDto node) {
        if (!leaveRequestNeo4jRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        LeaveRequestNode entity = node.toEntity();
        entity.setId(id);
        return LeaveRequestNodeDto.from(leaveRequestNeo4jRepository.save(entity));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) {
        if (!leaveRequestNeo4jRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        leaveRequestNeo4jRepository.deleteById(id);
    }
}
