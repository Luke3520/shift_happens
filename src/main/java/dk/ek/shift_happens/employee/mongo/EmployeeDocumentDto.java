package dk.ek.shift_happens.employee.mongo;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.function.Function;

/**
 * DTO for {@link EmployeeDocument}. Mirrors the document's nested structure
 * with nested records so the denormalised employee read model can be
 * transferred without exposing the persistence document itself.
 *
 * Security: loginPassword is write-only (accepted on create/update, never
 * serialized back); the nested contract's salaryAmount is omitted entirely.
 */
public record EmployeeDocumentDto(
        Integer employeeId,
        String employeeNumber,
        String firstName,
        String lastName,
        String email,
        @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
        String loginPassword,
        String phoneNumber,
        LocalDate hireDate,
        String employmentStatus,
        WorkLocation primaryWorkLocation,
        String userRole,
        List<EmployeeContract> employeeContracts,
        List<JobRole> jobRoles,
        List<LeaveRequest> leaveRequests,
        List<LeaveLedgerEntry> leaveLedger
) {
    public static EmployeeDocumentDto from(EmployeeDocument e) {
        return new EmployeeDocumentDto(
                e.getEmployeeId(),
                e.getEmployeeNumber(),
                e.getFirstName(),
                e.getLastName(),
                e.getEmail(),
                null,
                e.getPhoneNumber(),
                e.getHireDate(),
                e.getEmploymentStatus(),
                WorkLocation.from(e.getPrimaryWorkLocation()),
                e.getUserRole(),
                mapList(e.getEmployeeContracts(), EmployeeContract::from),
                mapList(e.getJobRoles(), JobRole::from),
                mapList(e.getLeaveRequests(), LeaveRequest::from),
                mapList(e.getLeaveLedger(), LeaveLedgerEntry::from)
        );
    }

    public EmployeeDocument toEntity() {
        EmployeeDocument e = new EmployeeDocument();
        e.setEmployeeId(employeeId);
        e.setEmployeeNumber(employeeNumber);
        e.setFirstName(firstName);
        e.setLastName(lastName);
        e.setEmail(email);
        e.setLoginPassword(loginPassword);
        e.setPhoneNumber(phoneNumber);
        e.setHireDate(hireDate);
        e.setEmploymentStatus(employmentStatus);
        e.setPrimaryWorkLocation(primaryWorkLocation == null ? null : primaryWorkLocation.toEntity());
        e.setUserRole(userRole);
        e.setEmployeeContracts(mapList(employeeContracts, EmployeeContract::toEntity));
        e.setJobRoles(mapList(jobRoles, JobRole::toEntity));
        e.setLeaveRequests(mapList(leaveRequests, LeaveRequest::toEntity));
        e.setLeaveLedger(mapList(leaveLedger, LeaveLedgerEntry::toEntity));
        return e;
    }

    public record WorkLocation(Integer workLocationId, String locationName) {
        static WorkLocation from(EmployeeDocument.WorkLocation s) {
            return s == null ? null : new WorkLocation(s.getWorkLocationId(), s.getLocationName());
        }

        EmployeeDocument.WorkLocation toEntity() {
            EmployeeDocument.WorkLocation s = new EmployeeDocument.WorkLocation();
            s.setWorkLocationId(workLocationId);
            s.setLocationName(locationName);
            return s;
        }
    }

    public record Department(Integer departmentId, String departmentName) {
        static Department from(EmployeeDocument.Department s) {
            return s == null ? null : new Department(s.getDepartmentId(), s.getDepartmentName());
        }

        EmployeeDocument.Department toEntity() {
            EmployeeDocument.Department s = new EmployeeDocument.Department();
            s.setDepartmentId(departmentId);
            s.setDepartmentName(departmentName);
            return s;
        }
    }

    public record EmployeeContract(
            Department department,
            String contractType,
            LocalDate startDate,
            LocalDate endDate,
            Integer weeklyHours,
            Boolean isActive
    ) {
        // salaryAmount is intentionally omitted — it must not be exposed.
        static EmployeeContract from(EmployeeDocument.EmployeeContract s) {
            if (s == null) return null;
            return new EmployeeContract(
                    Department.from(s.getDepartment()),
                    s.getContractType(),
                    s.getStartDate(),
                    s.getEndDate(),
                    s.getWeeklyHours(),
                    s.getIsActive()
            );
        }

        EmployeeDocument.EmployeeContract toEntity() {
            EmployeeDocument.EmployeeContract s = new EmployeeDocument.EmployeeContract();
            s.setDepartment(department == null ? null : department.toEntity());
            s.setContractType(contractType);
            s.setStartDate(startDate);
            s.setEndDate(endDate);
            s.setWeeklyHours(weeklyHours);
            // salaryAmount is not part of the DTO and is left null.
            s.setIsActive(isActive);
            return s;
        }
    }

    public record JobRole(
            String jobRoleId,
            String roleName,
            LocalDate assignedDate,
            LocalDate expiryDate,
            String proficiencyLevel
    ) {
        static JobRole from(EmployeeDocument.JobRole s) {
            if (s == null) return null;
            return new JobRole(
                    s.getJobRoleId(),
                    s.getRoleName(),
                    s.getAssignedDate(),
                    s.getExpiryDate(),
                    s.getProficiencyLevel()
            );
        }

        EmployeeDocument.JobRole toEntity() {
            EmployeeDocument.JobRole s = new EmployeeDocument.JobRole();
            s.setJobRoleId(jobRoleId);
            s.setRoleName(roleName);
            s.setAssignedDate(assignedDate);
            s.setExpiryDate(expiryDate);
            s.setProficiencyLevel(proficiencyLevel);
            return s;
        }
    }

    public record LeaveRequest(
            Integer leaveTypeId,
            LocalDate startDate,
            LocalDate endDate,
            String requestStatus,
            String reason,
            LocalDateTime requestedDatetime,
            List<Approval> approvals
    ) {
        static LeaveRequest from(EmployeeDocument.LeaveRequest s) {
            if (s == null) return null;
            return new LeaveRequest(
                    s.getLeaveTypeId(),
                    s.getStartDate(),
                    s.getEndDate(),
                    s.getRequestStatus(),
                    s.getReason(),
                    s.getRequestedDatetime(),
                    mapList(s.getApprovals(), Approval::from)
            );
        }

        EmployeeDocument.LeaveRequest toEntity() {
            EmployeeDocument.LeaveRequest s = new EmployeeDocument.LeaveRequest();
            s.setLeaveTypeId(leaveTypeId);
            s.setStartDate(startDate);
            s.setEndDate(endDate);
            s.setRequestStatus(requestStatus);
            s.setReason(reason);
            s.setRequestedDatetime(requestedDatetime);
            s.setApprovals(mapList(approvals, Approval::toEntity));
            return s;
        }
    }

    public record Approval(
            ApproverEmployee approverEmployee,
            String decision,
            String leaveComment,
            LocalDateTime decisionDatetime
    ) {
        static Approval from(EmployeeDocument.Approval s) {
            if (s == null) return null;
            return new Approval(
                    ApproverEmployee.from(s.getApproverEmployee()),
                    s.getDecision(),
                    s.getLeaveComment(),
                    s.getDecisionDatetime()
            );
        }

        EmployeeDocument.Approval toEntity() {
            EmployeeDocument.Approval s = new EmployeeDocument.Approval();
            s.setApproverEmployee(approverEmployee == null ? null : approverEmployee.toEntity());
            s.setDecision(decision);
            s.setLeaveComment(leaveComment);
            s.setDecisionDatetime(decisionDatetime);
            return s;
        }
    }

    public record ApproverEmployee(Integer employeeId, String firstName, String lastName) {
        static ApproverEmployee from(EmployeeDocument.ApproverEmployee s) {
            return s == null ? null
                    : new ApproverEmployee(s.getEmployeeId(), s.getFirstName(), s.getLastName());
        }

        EmployeeDocument.ApproverEmployee toEntity() {
            EmployeeDocument.ApproverEmployee s = new EmployeeDocument.ApproverEmployee();
            s.setEmployeeId(employeeId);
            s.setFirstName(firstName);
            s.setLastName(lastName);
            return s;
        }
    }

    public record LeaveLedgerEntry(
            Integer leaveTypeId,
            java.math.BigDecimal changeAmountDays,
            String transactionType,
            String referenceEntityType,
            Integer referenceEntityId,
            LocalDateTime transactionDatetime
    ) {
        static LeaveLedgerEntry from(EmployeeDocument.LeaveLedgerEntry s) {
            if (s == null) return null;
            return new LeaveLedgerEntry(
                    s.getLeaveTypeId(),
                    s.getChangeAmountDays(),
                    s.getTransactionType(),
                    s.getReferenceEntityType(),
                    s.getReferenceEntityId(),
                    s.getTransactionDatetime()
            );
        }

        EmployeeDocument.LeaveLedgerEntry toEntity() {
            EmployeeDocument.LeaveLedgerEntry s = new EmployeeDocument.LeaveLedgerEntry();
            s.setLeaveTypeId(leaveTypeId);
            s.setChangeAmountDays(changeAmountDays);
            s.setTransactionType(transactionType);
            s.setReferenceEntityType(referenceEntityType);
            s.setReferenceEntityId(referenceEntityId);
            s.setTransactionDatetime(transactionDatetime);
            return s;
        }
    }

    private static <S, T> List<T> mapList(List<S> src, Function<S, T> fn) {
        return src == null ? null : src.stream().map(fn).toList();
    }
}
