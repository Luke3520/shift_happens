package dk.ek.shift_happens.shift.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/neo4j/shifts")
@RequiredArgsConstructor
public class ShiftNeo4jController {

    private final ShiftNeo4jRepository shiftNeo4jRepository;

    @GetMapping
    public List<ShiftNodeDto> getAll() {
        return shiftNeo4jRepository.findAll().stream().map(ShiftNodeDto::from).toList();
    }

    @GetMapping("/{id}")
    public ShiftNodeDto getById(@PathVariable Long id) {
        return shiftNeo4jRepository.findById(id)
                .map(ShiftNodeDto::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }
}
