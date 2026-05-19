package dk.ek.shift_happens.leavetype.mongo;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Tag(name = "MongoDB - Leave Types")
@RestController
@RequestMapping("/mongo/leave_type")
@RequiredArgsConstructor
public class LeaveTypeMongoController {

    private final LeaveTypeMongoService leaveTypeMongoService;

    @GetMapping
    public List<LeaveTypeDocumentDto> getAll() {
        return leaveTypeMongoService.findAll().stream().map(LeaveTypeDocumentDto::from).toList();
    }

    @GetMapping("/{id}")
    public LeaveTypeDocumentDto getById(@PathVariable String id) {
        return leaveTypeMongoService.findById(id)
                .map(LeaveTypeDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public LeaveTypeDocumentDto create(@RequestBody LeaveTypeDocumentDto leaveType) {
        return LeaveTypeDocumentDto.from(leaveTypeMongoService.create(leaveType.toEntity()));
    }

    @PutMapping("/{id}")
    public LeaveTypeDocumentDto update(@PathVariable String id, @RequestBody LeaveTypeDocumentDto leaveType) {
        return leaveTypeMongoService.update(id, leaveType.toEntity())
                .map(LeaveTypeDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable String id) {
        if (!leaveTypeMongoService.delete(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }
}
