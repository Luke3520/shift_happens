package dk.ek.shift_happens.shiftapproval;

import static org.junit.jupiter.api.Assertions.assertInstanceOf;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import dk.ek.shift_happens.auth.CustomUserDetailsService;
import dk.ek.shift_happens.auth.JwtService;
import java.time.LocalDateTime;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.UserDetailsServiceAutoConfiguration;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.web.servlet.MockMvc;

/**
 * Web-layer (white-box) tests for {@link ShiftApprovalController}.
 *
 * <p>This controller talks straight to {@link ShiftApprovalRepository} with no service in between,
 * so the only logic worth covering at this layer is the wiring: routing, JSON (de)serialization,
 * the field-copy in {@code updateShiftApproval}, the success status codes, and how
 * {@link ShiftApprovalExceptionHandler} maps failures.
 *
 * <p>The repository is mocked. The JWT collaborators ({@link JwtService},
 * {@link CustomUserDetailsService}) are mocked so the security auto-configuration can load without a
 * database, mirroring {@code HolidayControllerTest}.
 *
 * <p>Note on scope: role-based authorization ({@code @PreAuthorize("hasAnyRole(...)")}) is enforced
 * by the full {@code SecurityConfig}, which is not loaded in a {@code @WebMvcTest} slice. The
 * ADMIN/MANAGER-only and employee→403 rules are therefore asserted in the API test
 * ({@code shiftapproval.api.spec.ts}), against the running application. Here we only verify the
 * authenticated-vs-401 boundary plus the controller's own behaviour.
 */
@WebMvcTest(
        controllers = ShiftApprovalController.class,
        excludeAutoConfiguration = UserDetailsServiceAutoConfiguration.class)
@Import(ShiftApprovalExceptionHandler.class)
@TestPropertySource(
        properties = {"jwt.secret=test-secret-test-secret-test-secret-0123456789", "security.pepper=test-pepper"})
class ShiftApprovalControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private ShiftApprovalRepository shiftApprovalRepository;

    @MockBean
    private JwtService jwtService;

    @MockBean
    private CustomUserDetailsService userDetailsService;

    private static ShiftApproval approval(Integer id, int assignmentId, int approverId, String decision) {
        ShiftApproval a = new ShiftApproval();
        a.setShiftApprovalId(id);
        a.setShiftAssignmentId(assignmentId);
        a.setApproverEmployeeId(approverId);
        a.setDecision(decision);
        a.setApprovalComment("comment");
        a.setDecisionDatetime(LocalDateTime.parse("2026-06-01T10:00:00"));
        return a;
    }

    // ── Reads ────────────────────────────────────────────────────────────────

    @Test
    @WithMockUser(roles = "MANAGER")
    void getAllReturnsApprovalsAsJson() throws Exception {
        when(shiftApprovalRepository.findAll()).thenReturn(List.of(approval(1, 10, 20, "Approved")));

        mockMvc.perform(get("/shiftapprovals"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].shiftApprovalId").value(1))
                .andExpect(jsonPath("$[0].decision").value("Approved"));
    }

    @Test
    @WithMockUser(roles = "MANAGER")
    void getByIdReturnsApprovalAsJson() throws Exception {
        when(shiftApprovalRepository.findById(1)).thenReturn(Optional.of(approval(1, 10, 20, "Declined")));

        mockMvc.perform(get("/shiftapprovals/1"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.shiftApprovalId").value(1))
                .andExpect(jsonPath("$.decision").value("Declined"))
                .andExpect(jsonPath("$.approverEmployeeId").value(20));
    }

    // ── Create ───────────────────────────────────────────────────────────────

    @Test
    @WithMockUser(roles = "ADMINISTRATOR")
    void createReturns200AndPersistsBody() throws Exception {
        when(shiftApprovalRepository.save(any(ShiftApproval.class))).thenReturn(approval(5, 10, 20, "Approved"));

        // The controller has no @ResponseStatus, so a successful create returns 200 (not 201).
        mockMvc.perform(
                        post("/shiftapprovals")
                                .with(csrf())
                                .contentType(MediaType.APPLICATION_JSON)
                                .content(
                                        """
                                {"shiftAssignmentId":10,"approverEmployeeId":20,"decision":"Approved","approvalComment":"ok"}
                                """))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.shiftApprovalId").value(5))
                .andExpect(jsonPath("$.decision").value("Approved"));

        verify(shiftApprovalRepository).save(any(ShiftApproval.class));
    }

    // ── Update ───────────────────────────────────────────────────────────────

    @Test
    @WithMockUser(roles = "ADMINISTRATOR")
    void updateCopiesFieldsOntoExistingApproval() throws Exception {
        when(shiftApprovalRepository.findById(1)).thenReturn(Optional.of(approval(1, 10, 20, "Approved")));
        // save returns whatever it is handed, so the response reflects the copied-over fields.
        when(shiftApprovalRepository.save(any(ShiftApproval.class)))
                .thenAnswer(invocation -> invocation.getArgument(0));

        mockMvc.perform(
                        put("/shiftapprovals/1")
                                .with(csrf())
                                .contentType(MediaType.APPLICATION_JSON)
                                .content(
                                        """
                                {"shiftAssignmentId":10,"approverEmployeeId":99,"decision":"Declined","approvalComment":"changed"}
                                """))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.decision").value("Declined"))
                .andExpect(jsonPath("$.approverEmployeeId").value(99))
                .andExpect(jsonPath("$.approvalComment").value("changed"));
    }

    @Test
    @WithMockUser(roles = "ADMINISTRATOR")
    void updateUnknownIdRaisesUnhandledNoSuchElement() throws Exception {
        // KNOWN GAP: updateShiftApproval calls findById(id).orElseThrow() with no argument, which
        // raises a NoSuchElementException. ShiftApprovalExceptionHandler maps only
        // IllegalArgumentException and ResponseStatusException, so this exception is unhandled — in
        // production it surfaces to the client as HTTP 500 (MockMvc re-throws it rather than
        // rendering the 500). This test pins the current behaviour; see the summary for the
        // suggested fix (map the missing id to a ResponseStatusException(404)).
        when(shiftApprovalRepository.findById(999)).thenReturn(Optional.empty());

        Throwable thrown = assertThrows(
                Throwable.class,
                () -> mockMvc.perform(put("/shiftapprovals/999")
                        .with(csrf())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"decision\":\"Approved\"}")));

        Throwable root = thrown;
        while (root.getCause() != null && root.getCause() != root) {
            root = root.getCause();
        }
        assertInstanceOf(NoSuchElementException.class, root);
    }

    // ── Delete ───────────────────────────────────────────────────────────────

    @Test
    @WithMockUser(roles = "ADMINISTRATOR")
    void deleteReturns200AndCallsRepository() throws Exception {
        // void handler with no @ResponseStatus → 200 OK.
        mockMvc.perform(delete("/shiftapprovals/3").with(csrf())).andExpect(status().isOk());

        verify(shiftApprovalRepository).deleteById(eq(3));
    }

    // ── Security boundary ──────────────────────────────────────────────────────

    @Test
    void unauthenticatedRequestIsRejectedWith401() throws Exception {
        mockMvc.perform(get("/shiftapprovals")).andExpect(status().isUnauthorized());
    }
}
