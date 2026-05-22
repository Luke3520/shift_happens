package dk.ek.shift_happens.employee.neo4j;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.neo4j.core.Neo4jClient;
import org.springframework.data.neo4j.core.Neo4jTemplate;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class EmployeeNeo4jService {
    private final EmployeeNeo4jRepository employeeNeo4jRepository;
    private final Neo4jTemplate neo4jTemplate;
    private final Neo4jClient neo4jClient;

    public List<EmployeeNode> findAll() {
        return employeeNeo4jRepository.findAll();
    }

    public Page<EmployeeNode> findAll(String employmentStatus, Integer primaryWorkLocationId, String userRole, String email, String firstName, String lastName, Pageable pageable) {
        StringBuilder filterBuilder = new StringBuilder("WHERE 1=1 ");
        Map<String, Object> parameters = new HashMap<>();

        if (employmentStatus != null) {
            filterBuilder.append("AND n.employmentStatus = $employmentStatus ");
            parameters.put("employmentStatus", employmentStatus);
        }
        if (primaryWorkLocationId != null) {
            filterBuilder.append("AND n.primaryWorkLocationId = $primaryWorkLocationId ");
            parameters.put("primaryWorkLocationId", primaryWorkLocationId);
        }
        if (userRole != null) {
            filterBuilder.append("AND n.userRole = $userRole ");
            parameters.put("userRole", userRole);
        }
        if (email != null) {
            filterBuilder.append("AND n.email CONTAINS $email ");
            parameters.put("email", email);
        }
        if (firstName != null) {
            filterBuilder.append("AND n.firstName CONTAINS $firstName ");
            parameters.put("firstName", firstName);
        }
        if (lastName != null) {
            filterBuilder.append("AND n.lastName CONTAINS $lastName ");
            parameters.put("lastName", lastName);
        }

        String countQuery = "MATCH (n:Employee) " + filterBuilder.toString() + " RETURN count(n) AS count";
        Long total = neo4jClient
                .query(countQuery)
                .bindAll(parameters)
                .fetchAs(Long.class)
                .one()
                .orElse(0L);

        StringBuilder queryBuilder = new StringBuilder("MATCH (n:Employee) ");
        queryBuilder.append(filterBuilder);

        // Sorting
        if (pageable.getSort().isSorted()) {
            queryBuilder.append("ORDER BY ");
            pageable.getSort().forEach(order -> {
                queryBuilder.append("n.").append(order.getProperty()).append(" ").append(order.getDirection().name()).append(", ");
            });
            queryBuilder.setLength(queryBuilder.length() - 2); // remove last comma
            queryBuilder.append(" ");
        }

        // Paging
        queryBuilder.append("SKIP ").append(pageable.getOffset()).append(" ");
        queryBuilder.append("LIMIT ").append(pageable.getPageSize()).append(" ");
        queryBuilder.append("RETURN n");

        List<EmployeeNode> list = neo4jTemplate.findAll(queryBuilder.toString(), parameters, EmployeeNode.class);

        return new PageImpl<>(list, pageable, total);
    }

    public Optional<EmployeeNode> findById(Long id) {
        return employeeNeo4jRepository.findById(id);
    }
}
