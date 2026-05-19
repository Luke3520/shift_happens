package dk.ek.shift_happens.leaverequest.mongo;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/mongo/leave")
@RequiredArgsConstructor
public class LeaveMongoController {

    private final LeaveMongoRepository leaveMongoRepository;

    @GetMapping
    public List<LeaveDocumentDto> getAll() {
        return leaveMongoRepository.findAll().stream().map(LeaveDocumentDto::from).toList();
    }

    @GetMapping("/{id}")
    public LeaveDocumentDto getById(@PathVariable String id) {
        return leaveMongoRepository.findById(id)
                .map(LeaveDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public LeaveDocumentDto create(@RequestBody LeaveDocumentDto leave) {
        return LeaveDocumentDto.from(leaveMongoRepository.save(leave.toEntity()));
    }

    @PutMapping("/{id}")
    public LeaveDocumentDto update(@PathVariable String id, @RequestBody LeaveDocumentDto leave) {
        if (!leaveMongoRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        LeaveDocument entity = leave.toEntity();
        entity.setId(id);
        return LeaveDocumentDto.from(leaveMongoRepository.save(entity));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable String id) {
        if (!leaveMongoRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        leaveMongoRepository.deleteById(id);
    }
}
