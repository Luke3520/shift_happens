package dk.ek.shift_happens.shiftswap.neo4j;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Tag(name = "Neo4j - Shift Swaps")
@RestController
@RequestMapping("/neo4j/shiftswaps")
@RequiredArgsConstructor
public class ShiftSwapNeo4jController {

    private final ShiftSwapNeo4jService shiftSwapNeo4jService;

    @GetMapping
    public List<ShiftSwapNodeDto> getAll() {
        return shiftSwapNeo4jService.findAll().stream().map(ShiftSwapNodeDto::from).toList();
    }

    @GetMapping("/{id}")
    public ResponseEntity<ShiftSwapNodeDto> getById(@PathVariable Long id) {
        return shiftSwapNeo4jService.findById(id)
                .map(ShiftSwapNodeDto::from)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/candidates/{shiftId}")
    public ResponseEntity<List<Map<String, Object>>> getSwapCandidates(@PathVariable Integer shiftId) {
        return ResponseEntity.ok(shiftSwapNeo4jService.findSwapCandidates(shiftId));
    }

    //kræver lige nu auth adgang, jeg tro fordi den bruger nået employe data som kun må tilgås som manager.
    @GetMapping("/candidates/location/{shiftId}")
    public ResponseEntity<List<Map<String, Object>>> getSwapCandidatesSameDepartmentAndLocation(@PathVariable Integer shiftId) {
        return ResponseEntity.ok(shiftSwapNeo4jService.findSwapCandidatesSameDepartmentAndLocation(shiftId));
    }

    /**
     * Executes the shift swap in Neo4j inside a single transaction.
     * Deletes the ASSIGNED_TO_SHIFT relationship from employeeFrom and creates
     * a new one for employeeTo, then marks the ShiftSwap node as 'completed'.
     *
     * @param shiftSwapId the shiftSwapId on the ShiftSwap node
     * @param shiftId     the shiftId of the Shift being swapped
     */
    @PostMapping("/{shiftSwapId}/execute")
    public ResponseEntity<Map<String, Object>> executeSwap(
            @PathVariable Integer shiftSwapId,
            @RequestParam Integer shiftId) {
        Map<String, Object> result = shiftSwapNeo4jService.executeSwap(shiftSwapId, shiftId);
        return ResponseEntity.ok(result);
    }
}
