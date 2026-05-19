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

    private final ShiftMongoRepository shiftMongoRepository;

    @GetMapping
    public List<ShiftDocumentDto> getAll() {
        return shiftMongoRepository.findAll().stream().map(ShiftDocumentDto::from).toList();
    }

    @GetMapping("/{id}")
    public ShiftDocumentDto getById(@PathVariable Integer id) {
        return shiftMongoRepository.findById(id)
                .map(ShiftDocumentDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public ShiftDocumentDto create(@RequestBody ShiftDocumentDto shift) {
        return ShiftDocumentDto.from(shiftMongoRepository.save(shift.toEntity()));
    }

    @PutMapping("/{id}")
    public ShiftDocumentDto update(@PathVariable Integer id, @RequestBody ShiftDocumentDto shift) {
        if (!shiftMongoRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        ShiftDocument entity = shift.toEntity();
        entity.setShiftId(id);
        return ShiftDocumentDto.from(shiftMongoRepository.save(entity));
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Integer id) {
        if (!shiftMongoRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        shiftMongoRepository.deleteById(id);
    }
}
