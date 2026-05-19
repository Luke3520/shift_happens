package dk.ek.shift_happens.leavetype.mongo;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/mongo/leave_type")
@RequiredArgsConstructor
public class LeaveTypeMongoController {

    private final LeaveTypeMongoRepository leaveTypeMongoRepository;

    @GetMapping
    public List<LeaveTypeDocumentDto> getAll() {
        return leaveTypeMongoRepository.findAll().stream().map(LeaveTypeDocumentDto::from).toList();
    }

    @GetMapping("/{id}")
    public LeaveTypeDocumentDto getById(@PathVariable String id) {
        return leaveTypeMongoRepository.findById(id)
                .map(LeaveTypeDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public LeaveTypeDocumentDto create(@RequestBody LeaveTypeDocumentDto leaveType) {
        return LeaveTypeDocumentDto.from(leaveTypeMongoRepository.save(leaveType.toEntity()));
    }

    @PutMapping("/{id}")
    public LeaveTypeDocumentDto update(@PathVariable String id, @RequestBody LeaveTypeDocumentDto leaveType) {
        if (!leaveTypeMongoRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        LeaveTypeDocument entity = leaveType.toEntity();
        entity.setId(id);
        return LeaveTypeDocumentDto.from(leaveTypeMongoRepository.save(entity));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable String id) {
        if (!leaveTypeMongoRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        leaveTypeMongoRepository.deleteById(id);
    }
}
