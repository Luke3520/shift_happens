package dk.ek.shift_happens.leaverequest.mongo;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Tag(name = "MongoDB - Leave Requests")
@RestController
@RequestMapping("/mongo/leave")
@RequiredArgsConstructor
public class LeaveMongoController {

    private final LeaveMongoService leaveMongoService;

    @GetMapping
    public List<LeaveDocumentDto> getAll() {
        return leaveMongoService.findAll().stream().map(LeaveDocumentDto::from).toList();
    }

    @GetMapping("/{id}")
    public LeaveDocumentDto getById(@PathVariable String id) {
        return leaveMongoService.findById(id)
                .map(LeaveDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public LeaveDocumentDto create(@RequestBody LeaveDocumentDto leave) {
        return LeaveDocumentDto.from(leaveMongoService.create(leave.toEntity()));
    }

    @PutMapping("/{id}")
    public LeaveDocumentDto update(@PathVariable String id, @RequestBody LeaveDocumentDto leave) {
        return leaveMongoService.update(id, leave.toEntity())
                .map(LeaveDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable String id) {
        if (!leaveMongoService.delete(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }
}
