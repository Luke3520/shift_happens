package dk.ek.shift_happens.shiftrequiredjobrole;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.lenient;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import dk.ek.shift_happens.jobrole.JobRoleRepository;
import dk.ek.shift_happens.shift.ShiftRepository;
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
class ShiftRequiredJobRoleServiceTest {

    @Mock
    private ShiftRequiredJobRoleRepository repository;

    @Mock
    private ShiftRepository shiftRepository;

    @Mock
    private JobRoleRepository jobRoleRepository;

    private ShiftRequiredJobRoleService service;

    @BeforeEach
    void setUp() {
        service = new ShiftRequiredJobRoleService(repository, shiftRepository, jobRoleRepository);
        lenient().when(shiftRepository.existsById(1)).thenReturn(true);
        lenient().when(jobRoleRepository.existsById(2)).thenReturn(true);
        lenient().when(repository.save(any(ShiftRequiredJobRole.class))).thenAnswer(inv -> inv.getArgument(0));
    }

    private ShiftRequiredJobRole base() {
        ShiftRequiredJobRole required = new ShiftRequiredJobRole();
        required.setShiftId(1);
        required.setJobRoleId(2);
        required.setRequiredEmployeeCount(3);
        return required;
    }

    @Nested
    class Queries {

        @Test
        void should_return_all_required_roles() {
            when(repository.findAll()).thenReturn(List.of(base(), base()));
            assertThat(service.findAll()).hasSize(2);
        }

        @Test
        void should_return_required_role_by_id() {
            ShiftRequiredJobRole required = base();
            when(repository.findById(7)).thenReturn(Optional.of(required));
            assertThat(service.findById(7)).isSameAs(required);
        }

        @Test
        void should_throw_not_found_when_id_is_unknown() {
            when(repository.findById(99)).thenReturn(Optional.empty());
            assertThatThrownBy(() -> service.findById(99))
                    .isInstanceOf(ResponseStatusException.class)
                    .hasMessageContaining("Required job role not found");
        }
    }

    @Nested
    class Create {

        @Test
        void should_create_valid_required_role_and_clear_client_id() {
            ShiftRequiredJobRole required = base();
            required.setShiftRequiredJobRoleId(99);

            ShiftRequiredJobRole result = service.create(required);

            assertThat(result.getShiftRequiredJobRoleId()).isNull();
            verify(repository).save(required);
        }

        @Test
        void should_reject_duplicate_shift_job_role_combination() {
            when(repository.findByShiftIdAndJobRoleId(1, 2)).thenReturn(Optional.of(base()));

            assertThatThrownBy(() -> service.create(base()))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("already exists");
            verify(repository, never()).save(any(ShiftRequiredJobRole.class));
        }
    }

    @Nested
    class Validation {

        @Test
        void should_reject_missing_shift_id() {
            ShiftRequiredJobRole required = base();
            required.setShiftId(null);
            assertThatThrownBy(() -> service.create(required))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("shiftId");
        }

        @Test
        void should_reject_non_positive_shift_id() {
            ShiftRequiredJobRole required = base();
            required.setShiftId(0);
            assertThatThrownBy(() -> service.create(required))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("positive");
        }

        @Test
        void should_reject_unknown_shift() {
            when(shiftRepository.existsById(1)).thenReturn(false);
            assertThatThrownBy(() -> service.create(base()))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("does not exist");
        }

        @Test
        void should_reject_missing_job_role_id() {
            ShiftRequiredJobRole required = base();
            required.setJobRoleId(null);
            assertThatThrownBy(() -> service.create(required))
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
        void should_reject_missing_required_count() {
            ShiftRequiredJobRole required = base();
            required.setRequiredEmployeeCount(null);
            assertThatThrownBy(() -> service.create(required))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("requiredEmployeeCount");
        }

        @Test
        void should_reject_count_below_minimum() {
            ShiftRequiredJobRole required = base();
            required.setRequiredEmployeeCount(ShiftRequiredJobRoleService.MIN_REQUIRED_COUNT - 1);
            assertThatThrownBy(() -> service.create(required))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("between");
        }

        @Test
        void should_accept_count_at_minimum() {
            ShiftRequiredJobRole required = base();
            required.setRequiredEmployeeCount(ShiftRequiredJobRoleService.MIN_REQUIRED_COUNT);
            assertThat(service.create(required).getRequiredEmployeeCount())
                    .isEqualTo(ShiftRequiredJobRoleService.MIN_REQUIRED_COUNT);
        }

        @Test
        void should_accept_count_at_maximum() {
            ShiftRequiredJobRole required = base();
            required.setRequiredEmployeeCount(ShiftRequiredJobRoleService.MAX_REQUIRED_COUNT);
            assertThat(service.create(required).getRequiredEmployeeCount())
                    .isEqualTo(ShiftRequiredJobRoleService.MAX_REQUIRED_COUNT);
        }

        @Test
        void should_reject_count_above_maximum() {
            ShiftRequiredJobRole required = base();
            required.setRequiredEmployeeCount(ShiftRequiredJobRoleService.MAX_REQUIRED_COUNT + 1);
            assertThatThrownBy(() -> service.create(required))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("between");
        }
    }

    @Nested
    class Update {

        @Test
        void should_merge_non_null_fields_and_save() {
            ShiftRequiredJobRole existing = base();
            existing.setShiftRequiredJobRoleId(5);
            when(repository.findById(5)).thenReturn(Optional.of(existing));

            ShiftRequiredJobRole updates = new ShiftRequiredJobRole();
            updates.setShiftId(3);
            updates.setJobRoleId(4);
            updates.setRequiredEmployeeCount(6);
            when(shiftRepository.existsById(3)).thenReturn(true);
            when(jobRoleRepository.existsById(4)).thenReturn(true);

            ShiftRequiredJobRole result = service.update(5, updates);

            assertThat(result.getShiftId()).isEqualTo(3);
            assertThat(result.getJobRoleId()).isEqualTo(4);
            assertThat(result.getRequiredEmployeeCount()).isEqualTo(6);
            verify(repository).save(existing);
        }

        @Test
        void should_reject_update_that_would_duplicate_another_required_role() {
            ShiftRequiredJobRole existing = base();
            existing.setShiftRequiredJobRoleId(5);
            when(repository.findById(5)).thenReturn(Optional.of(existing));

            ShiftRequiredJobRole duplicate = base();
            duplicate.setShiftRequiredJobRoleId(6);
            when(repository.findByShiftIdAndJobRoleId(1, 2)).thenReturn(Optional.of(duplicate));

            assertThatThrownBy(() -> service.update(5, new ShiftRequiredJobRole()))
                    .isInstanceOf(IllegalArgumentException.class)
                    .hasMessageContaining("already exists");
        }

        @Test
        void should_ignore_duplicate_when_it_is_same_record() {
            ShiftRequiredJobRole existing = base();
            existing.setShiftRequiredJobRoleId(5);
            when(repository.findById(5)).thenReturn(Optional.of(existing));
            when(repository.findByShiftIdAndJobRoleId(1, 2)).thenReturn(Optional.of(existing));

            assertThat(service.update(5, new ShiftRequiredJobRole())).isSameAs(existing);
        }
    }

    @Test
    void should_delete_existing_required_role() {
        ShiftRequiredJobRole existing = base();
        when(repository.findById(5)).thenReturn(Optional.of(existing));

        service.delete(5);

        verify(repository).delete(existing);
    }
}
