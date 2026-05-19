package dk.ek.shift_happens.migration;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "Migration")
@RestController
@RequestMapping("/migrate")
@RequiredArgsConstructor
public class MigrationController {

    private final MigrationService migrationService;

    // Migrates all MySQL data into both MongoDB and Neo4j.
    // Clears existing secondary-DB data before writing to ensure a clean state.
    @PostMapping
    public MigrationResult migrateAll() {
        return migrationService.migrateAll();
    }

    @PostMapping("/mongo")
    public MigrationResult migrateToMongo() {
        return migrationService.migrateToMongo();
    }

    @PostMapping("/neo4j")
    public MigrationResult migrateToNeo4j() {
        return migrationService.migrateToNeo4j();
    }
}
