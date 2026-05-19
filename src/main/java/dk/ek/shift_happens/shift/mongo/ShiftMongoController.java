package dk.ek.shift_happens.shift.mongo;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/mongo/shifts")
@RequiredArgsConstructor
public class ShiftMongoController {

    private final ShiftMongoService shiftMongoService;

    @GetMapping
    public List<ShiftDocumentDto> getAll() {
        return shiftMongoService.findAll().stream().map(ShiftDocumentDto::from).toList();
    }

    @GetMapping("/{id}")
    public ShiftDocumentDto getById(@PathVariable Integer id) {
        return shiftMongoService.findById(id)
                .map(ShiftDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public ShiftDocumentDto create(@RequestBody ShiftDocumentDto shift) {
        return ShiftDocumentDto.from(shiftMongoService.create(shift.toEntity()));
    }

    @PutMapping("/{id}")
    public ShiftDocumentDto update(@PathVariable Integer id, @RequestBody ShiftDocumentDto shift) {
        return shiftMongoService.update(id, shift.toEntity())
                .map(ShiftDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) {
        if (!shiftMongoService.delete(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }
}
