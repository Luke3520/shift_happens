package dk.ek.shift_happens.shiftswap.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.data.neo4j.core.Neo4jClient;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ShiftSwapNeo4jService {

    private final ShiftSwapNeo4jRepository shiftSwapNeo4jRepository;
    private final Neo4jClient neo4jClient;

    public List<ShiftSwapNode> findAll() {
        return shiftSwapNeo4jRepository.findAll();
    }

    public Optional<ShiftSwapNode> findById(Long id) {
        return shiftSwapNeo4jRepository.findById(id);
    }

    /**
     * Returns swap candidates for a shift: active employees who hold a required
     * role, work in the shift's department, and have no conflicting assignment.
     */
    public List<Map<String, Object>> findSwapCandidates(Integer shiftId) {
        String cypher = """
                MATCH (target:Shift {shiftId: $shiftId})-[:SHIFT_IN_DEPT]->(targetDepartment:Department)
                MATCH (target)-[:REQUIRES_ROLE]->(requiredRole:JobRole)
                MATCH (candidate:Employee)-[:HAS_JOB_ROLE]->(requiredRole)
                MATCH (candidate)-[:WORKS_IN_DEPT]->(targetDepartment)
                WHERE coalesce(candidate.employmentStatus, '') = 'ACTIVE'
                  AND NOT EXISTS {
                      MATCH (candidate)-[:ASSIGNED_TO_SHIFT]->(target)
                  }
                  AND NOT EXISTS {
                      MATCH (candidate)-[:ASSIGNED_TO_SHIFT]->(other:Shift)
                      WHERE other.startDatetime < target.endDatetime
                        AND other.endDatetime > target.startDatetime
                  }
                OPTIONAL MATCH (candidate)-[:WORKS_AT_LOCATION]->(location:WorkLocation)
                  WITH target, targetDepartment, candidate, location,
                     collect(DISTINCT requiredRole.roleName) AS matchingRoles
                RETURN target.shiftId AS shiftId,
                       target.shiftName AS shiftName,
                       candidate.employeeId AS employeeId,
                       candidate.employeeNumber AS employeeNumber,
                       candidate.firstName AS firstName,
                       candidate.lastName AS lastName,
                       candidate.email AS email,
                      targetDepartment.departmentName AS department,
                       location.locationName AS location,
                       matchingRoles
                ORDER BY candidate.firstName, candidate.lastName
                """;
        return runCandidateQuery(cypher, shiftId);
    }

    /**
     * As {@link #findSwapCandidates}, but additionally constrained to candidates
     * who work at the shift's location.
     */
    public List<Map<String, Object>> findSwapCandidatesSameDepartmentAndLocation(Integer shiftId) {
        String cypher = """
                MATCH (target:Shift {shiftId: $shiftId})-[:SHIFT_IN_DEPT]->(targetDepartment:Department)
                MATCH (target)-[:SHIFT_AT_LOCATION]->(targetLocation:WorkLocation)
                MATCH (target)-[:REQUIRES_ROLE]->(requiredRole:JobRole)
                MATCH (candidate:Employee)-[:HAS_JOB_ROLE]->(requiredRole)
                MATCH (candidate)-[:WORKS_IN_DEPT]->(targetDepartment)
                MATCH (candidate)-[:WORKS_AT_LOCATION]->(targetLocation)
                WHERE coalesce(candidate.employmentStatus, '') = 'ACTIVE'
                  AND NOT EXISTS {
                      MATCH (candidate)-[:ASSIGNED_TO_SHIFT]->(target)
                  }
                  AND NOT EXISTS {
                      MATCH (candidate)-[:ASSIGNED_TO_SHIFT]->(other:Shift)
                      WHERE other.startDatetime < target.endDatetime
                        AND other.endDatetime > target.startDatetime
                  }
                WITH target, targetDepartment, targetLocation, candidate,
                     collect(DISTINCT requiredRole.roleName) AS matchingRoles
                RETURN target.shiftId AS shiftId,
                       target.shiftName AS shiftName,
                       candidate.employeeId AS employeeId,
                       candidate.employeeNumber AS employeeNumber,
                       candidate.firstName AS firstName,
                       candidate.lastName AS lastName,
                       candidate.email AS email,
                       targetDepartment.departmentName AS department,
                       targetLocation.locationName AS location,
                       matchingRoles
                ORDER BY candidate.firstName, candidate.lastName
                """;
        return runCandidateQuery(cypher, shiftId);
    }

    private List<Map<String, Object>> runCandidateQuery(String cypher, Integer shiftId) {
        Collection<Map<String, Object>> rows = neo4jClient.query(cypher)
                .bind(shiftId).to("shiftId")
                .fetch()
                .all();

        return new ArrayList<>(rows);
    }

    /**
     * Executes a shift swap inside a single Neo4j transaction:
     *  1. Validates the ShiftSwap node exists and has status 'pending'.
     *  2. Deletes the ASSIGNED_TO_SHIFT relationship from employeeFrom → shift.
     *  3. Creates a new ASSIGNED_TO_SHIFT relationship from employeeTo → shift.
     *  4. Sets the ShiftSwap node's swapStatus to 'completed'.
     *
     * If any part fails the entire transaction is rolled back.
     *
     * @param shiftSwapId the MySQL-mirrored shiftSwapId on the ShiftSwap node
     * @param shiftId     the shiftId on the target Shift node
     */
    @Transactional
    public Map<String, Object> executeSwap(Integer shiftSwapId, Integer shiftId) {
        String cypher = """
                MATCH (swap:ShiftSwap {shiftSwapId: $swapId})
                WHERE swap.swapStatus = 'pending'
                MATCH (fromEmp:Employee {employeeId: swap.employeeFromId})-[r:ASSIGNED_TO_SHIFT]->(shift:Shift {shiftId: $shiftId})
                MATCH (toEmp:Employee {employeeId: swap.employeeToId})
                DELETE r
                CREATE (toEmp)-[:ASSIGNED_TO_SHIFT]->(shift)
                SET swap.swapStatus = 'completed'
                RETURN swap.shiftSwapId AS shiftSwapId,
                       swap.employeeFromId AS employeeFromId,
                       swap.employeeToId AS employeeToId,
                       swap.swapStatus AS swapStatus,
                       shift.shiftId AS shiftId,
                       shift.shiftName AS shiftName
                """;

        Optional<Map<String, Object>> result = neo4jClient.query(cypher)
                .bind(shiftSwapId).to("swapId")
                .bind(shiftId).to("shiftId")
                .fetch()
                .one();

        return result.orElseThrow(() -> new IllegalStateException(
                "Swap could not be executed. Check that shiftSwapId=" + shiftSwapId
                + " exists, has status 'pending', and shiftId=" + shiftId + " is assigned to employeeFrom."));
    }
}
