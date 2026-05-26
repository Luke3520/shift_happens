package dk.ek.shift_happens.shiftassignment;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import dk.ek.shift_happens.auth.AuthHelper;
import dk.ek.shift_happens.auth.CustomUserDetailsService;
import dk.ek.shift_happens.auth.JwtService;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.UserDetailsServiceAutoConfiguration;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.http.HttpStatus;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.server.ResponseStatusException;

/**
 * Web-layer (white-box) tests for {@link ShiftAssignmentController}.
 *
 * <p>{@code ShiftAssignmentServiceTest} already exercises the business rules (overlap/rest, weekly
 * hours, consecutive days/nights, role matching) thoroughly. What it cannot reach is the
 * per-request authorization the <em>controller</em> layers on top via {@link AuthHelper}: an
 * EMPLOYEE only sees their own assignments, and is forbidden from reading another employee's. Those
 * branches are the focus here.
 *
 * <p>The service and {@link AuthHelper} are mocked so the branch under test is the only variable.
 * As with {@code HolidayControllerTest}, the JWT collaborators are mocked so security
 * auto-configuration loads without a database. Role-based write rules ({@code @PreAuthorize}) live
 * in {@code SecurityConfig} (not loaded in a slice) and are asserted in
 * {@code shiftassignment.api.spec.ts}.
 */
@WebMvcTest(
        controllers = ShiftAssignmentController.class,
        excludeAutoConfiguration = UserDetailsServiceAutoConfiguration.class)
@Import(ShiftAssignmentExceptionHandler.class)
@TestPropertySource(
        properties = {"jwt.secret=test-secret-test-secret-test-secret-0123456789", "security.pepper=test-pepper"})
class ShiftAssignmentControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private ShiftAssignmentService shiftAssignmentService;

    @MockBean
    private AuthHelper authHelper;

    @MockBean
    private JwtService jwtService;

    @MockBean
    private CustomUserDetailsService userDetailsService;

    private static ShiftAssignment assignment(int id, int shiftId, int employeeId) {
        ShiftAssignment a = new ShiftAssignment();
        a.setShiftAssignmentId(id);
        a.setShiftId(shiftId);
        a.setEmployeeId(employeeId);
        a.setAssignmentStatus("Assigned");
        return a;
    }

    // ── List scoping ───────────────────────────────────────────────────────────

    @Test
    @WithMockUser(roles = "EMPLOYEE")
    void employeeListingSeesOnlyTheirOwnAssignments() throws Exception {
        when(authHelper.isEmployee(any())).thenReturn(true);
        when(authHelper.currentEmployeeId(any())).thenReturn(7);
        when(shiftAssignmentService.findByEmployeeId(7)).thenReturn(List.of(assignment(1, 10, 7)));

        mockMvc.perform(get("/shiftassignments"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].employeeId").value(7));

        verify(shiftAssignmentService).findByEmployeeId(7);
        verify(shiftAssignmentService, never()).findAll();
    }

    @Test
    @WithMockUser(roles = "MANAGER")
    void managerListingSeesAllAssignments() throws Exception {
        when(authHelper.isEmployee(any())).thenReturn(false);
        when(shiftAssignmentService.findAll()).thenReturn(List.of(assignment(1, 10, 7), assignment(2, 11, 8)));

        mockMvc.perform(get("/shiftassignments"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(2));

        verify(shiftAssignmentService).findAll();
        verify(shiftAssignmentService, never()).findByEmployeeId(any());
    }

    // ── Single-record scoping ───────────────────────────────────────────────────

    @Test
    @WithMockUser(roles = "EMPLOYEE")
    void employeeCanReadTheirOwnAssignmentById() throws Exception {
        when(authHelper.isEmployee(any())).thenReturn(true);
        when(authHelper.currentEmployeeId(any())).thenReturn(7);
        when(shiftAssignmentService.findById(1)).thenReturn(assignment(1, 10, 7));

        mockMvc.perform(get("/shiftassignments/1"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.shiftAssignmentId").value(1));
    }

    @Test
    @WithMockUser(roles = "EMPLOYEE")
    void employeeReadingAnotherEmployeesAssignmentIsForbidden() throws Exception {
        when(authHelper.isEmployee(any())).thenReturn(true);
        when(authHelper.currentEmployeeId(any())).thenReturn(7);
        when(shiftAssignmentService.findById(2)).thenReturn(assignment(2, 11, 8)); // belongs to employee 8
        when(authHelper.forbidden()).thenReturn(new ResponseStatusException(HttpStatus.FORBIDDEN, "Forbidden"));

        mockMvc.perform(get("/shiftassignments/2")).andExpect(status().isForbidden());
    }

    @Test
    @WithMockUser(roles = "MANAGER")
    void unknownAssignmentIdReturns404() throws Exception {
        when(authHelper.isEmployee(any())).thenReturn(false);
        when(shiftAssignmentService.findById(999))
                .thenThrow(new ResponseStatusException(HttpStatus.NOT_FOUND, "Assignment not found with id 999"));

        mockMvc.perform(get("/shiftassignments/999")).andExpect(status().isNotFound());
    }

    // ── Security boundary ──────────────────────────────────────────────────────

    @Test
    void unauthenticatedRequestIsRejectedWith401() throws Exception {
        mockMvc.perform(get("/shiftassignments")).andExpect(status().isUnauthorized());
    }
}
