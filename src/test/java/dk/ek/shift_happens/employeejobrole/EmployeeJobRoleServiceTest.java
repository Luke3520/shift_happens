package dk.ek.shift_happens.employeejobrole;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.lenient;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import dk.ek.shift_happens.employee.EmployeeRepository;
import dk.ek.shift_happens.jobrole.JobRoleRepository;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.web.server.ResponseStatusException;

@ExtendWith(MockitoExtension.class)
class EmployeeJobRoleServiceTest {

    @Mock
    private EmployeeJobRoleRepository repository;

    @Mock
    private EmployeeRepository employeeRepository;

    @Mock
    private JobRoleRepository jobRoleRepository;

    private EmployeeJobRoleService service;

    @BeforeEach
    void setUp() {
        service = new EmployeeJobRoleService(repository, employeeRepository, jobRoleRepository);
        lenient().when(employeeRepository.existsById(1)).thenReturn(true);
        lenient().when(jobRoleRepository.existsById(2)).thenReturn(true);
        lenient().when(repository.save(any(EmployeeJobRole.class))).thenAnswer(inv -> inv.getArgument(0));
    }

    private EmployeeJobRole base() {
        EmployeeJobRole role = new EmployeeJobRole();
        role.setEmployeeId(1);
        role.setJobRoleId(2);
        role.setAssignedDate(LocalDate.of(2026, 5, 1));
        role.setExpiryDate(LocalDate.of(2026, 12, 31));
        role.setProficiencyLevel("Senior");
        return role;
    }

    @Nested
    class Queries {

        @Test
        void should_return_all_roles() {
            when(repository.findAll()).thenReturn(List.of(base(), base()));
            assertThat(service.getAll()).hasSize(2);
        }

        @Test
        void should_return_roles_for_employee() {
            when(repository.findByEmployeeId(1)).thenReturn(List.of(base()));
            assertThat(service.getByEmployeeId(1)).hasSize(1);
        }

        @Test
        void should_throw_not_found_when_id_is_unknown() {
            when(repository.findById(99)).thenReturn(Optional.empty());
            assertThatThrownBy(() -> service.getById(99))
                    .isInstanceOf(ResponseStatusException.class)
                    .hasMessageContaining("Employee job role not found");
        }
    }

    @Nested
    class Create {

        @Test
        void should_create_valid_role_and_clear_client_id() {
            EmployeeJobRole role = base();
            role.setEmployeeJobRoleId(99);

            EmployeeJobRole result = service.create(role);

            assertThat(result.getEmployeeJobRoleId()).isNull();
            verify(repository).save(role);
        }

        @Test
        void should_reject_duplicate_employee_job_role() {
            when(repository.findByEmployeeIdAndJobRoleId(1, 2)).thenReturn(Optional.of(base()));

            assertThatThrownBy(() -> service.create(base()))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("already holds");
            verify(repository, never()).save(any(EmployeeJobRole.class));
        }
    }

    @Nested
    class Validation {

        @Test
        void should_reject_missing_employee_id() {
            EmployeeJobRole role = base();
            role.setEmployeeId(null);
            assertThatThrownBy(() -> service.create(role))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("employeeId");
        }

        @Test
        void should_reject_non_positive_employee_id() {
            EmployeeJobRole role = base();
            role.setEmployeeId(0);
            assertThatThrownBy(() -> service.create(role))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("positive");
        }

        @Test
        void should_reject_unknown_employee() {
            when(employeeRepository.existsById(1)).thenReturn(false);
            assertThatThrownBy(() -> service.create(base()))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("does not exist");
        }

        @Test
        void should_reject_missing_job_role_id() {
            EmployeeJobRole role = base();
            role.setJobRoleId(null);
            assertThatThrownBy(() -> service.create(role))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("jobRoleId");
        }

        @Test
        void should_reject_unknown_job_role() {
            when(jobRoleRepository.existsById(2)).thenReturn(false);
            assertThatThrownBy(() -> service.create(base()))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("does not exist");
        }

        @Test
        void should_reject_expiry_before_assigned_date() {
            EmployeeJobRole role = base();
            role.setExpiryDate(LocalDate.of(2026, 4, 30));
            assertThatThrownBy(() -> service.create(role))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("expiryDate");
        }

        @Test
        void should_reject_unknown_proficiency() {
            EmployeeJobRole role = base();
            role.setProficiencyLevel("Expert");
            assertThatThrownBy(() -> service.create(role))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("proficiencyLevel");
        }

        @Test
        void should_allow_blank_proficiency() {
            EmployeeJobRole role = base();
            role.setProficiencyLevel(" ");
            assertThat(service.create(role).getProficiencyLevel()).isBlank();
        }
    }

    @Nested
    class Update {

        @Test
        void should_merge_non_null_fields_and_save() {
            EmployeeJobRole existing = base();
            existing.setEmployeeJobRoleId(5);
            when(repository.findById(5)).thenReturn(Optional.of(existing));

            EmployeeJobRole updates = new EmployeeJobRole();
            updates.setJobRoleId(3);
            updates.setAssignedDate(LocalDate.of(2026, 6, 1));
            updates.setExpiryDate(LocalDate.of(2026, 9, 1));
            updates.setProficiencyLevel("Lead");
            when(jobRoleRepository.existsById(3)).thenReturn(true);

            EmployeeJobRole result = service.update(5, updates);

            assertThat(result.getEmployeeId()).isEqualTo(1);
            assertThat(result.getJobRoleId()).isEqualTo(3);
            assertThat(result.getProficiencyLevel()).isEqualTo("Lead");
            verify(repository).save(existing);
        }

        @Test
        void should_reject_update_that_would_duplicate_another_role() {
            EmployeeJobRole existing = base();
            existing.setEmployeeJobRoleId(5);
            when(repository.findById(5)).thenReturn(Optional.of(existing));

            EmployeeJobRole duplicate = base();
            duplicate.setEmployeeJobRoleId(6);
            when(repository.findByEmployeeIdAndJobRoleId(1, 2)).thenReturn(Optional.of(duplicate));

            assertThatThrownBy(() -> service.update(5, new EmployeeJobRole()))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("already holds");
        }

        @Test
        void should_ignore_duplicate_when_it_is_same_record() {
            EmployeeJobRole existing = base();
            existing.setEmployeeJobRoleId(5);
            when(repository.findById(5)).thenReturn(Optional.of(existing));
            when(repository.findByEmployeeIdAndJobRoleId(1, 2)).thenReturn(Optional.of(existing));

            assertThat(service.update(5, new EmployeeJobRole())).isSameAs(existing);
        }
    }

    @Test
    void should_delete_existing_role() {
        EmployeeJobRole existing = base();
        when(repository.findById(5)).thenReturn(Optional.of(existing));

        service.delete(5);

        verify(repository).delete(existing);
    }
}
