package dk.ek.shift_happens.shift.mongo;

import java.time.LocalDateTime;
import java.util.List;
import java.util.function.Function;

/**
 * DTO for {@link ShiftDocument}. Mirrors the document's nested structure with
 * nested records so the denormalised shift read model can be transferred
 * without exposing the persistence document itself.
 */
public record ShiftDocumentDto(
        Integer shiftId,
        String shiftName,
        LocalDateTime startDateTime,
        LocalDateTime endDateTime,
        String shiftStatus,
        Department department,
        WorkLocation workLocation,
        List<RequiredJobRole> requiredJobRoles,
        List<ShiftAssignment> shiftAssignments
) {
    public static ShiftDocumentDto from(ShiftDocument d) {
        return new ShiftDocumentDto(
                d.getShiftId(),
                d.getShiftName(),
                d.getStartDateTime(),
                d.getEndDateTime(),
                d.getShiftStatus(),
                Department.from(d.getDepartment()),
                WorkLocation.from(d.getWorkLocation()),
                mapList(d.getRequiredJobRoles(), RequiredJobRole::from),
                mapList(d.getShiftAssignments(), ShiftAssignment::from)
        );
    }

    public ShiftDocument toEntity() {
        ShiftDocument d = new ShiftDocument();
        d.setShiftId(shiftId);
        d.setShiftName(shiftName);
        d.setStartDateTime(startDateTime);
        d.setEndDateTime(endDateTime);
        d.setShiftStatus(shiftStatus);
        d.setDepartment(department == null ? null : department.toEntity());
        d.setWorkLocation(workLocation == null ? null : workLocation.toEntity());
        d.setRequiredJobRoles(mapList(requiredJobRoles, RequiredJobRole::toEntity));
        d.setShiftAssignments(mapList(shiftAssignments, ShiftAssignment::toEntity));
        return d;
    }

    public record Department(Integer departmentId, String departmentName) {
        static Department from(ShiftDocument.Department s) {
            return s == null ? null : new Department(s.getDepartmentId(), s.getDepartmentName());
        }

        ShiftDocument.Department toEntity() {
            ShiftDocument.Department s = new ShiftDocument.Department();
            s.setDepartmentId(departmentId);
            s.setDepartmentName(departmentName);
            return s;
        }
    }

    public record WorkLocation(Integer workLocationId, String locationName) {
        static WorkLocation from(ShiftDocument.WorkLocation s) {
            return s == null ? null : new WorkLocation(s.getWorkLocationId(), s.getLocationName());
        }

        ShiftDocument.WorkLocation toEntity() {
            ShiftDocument.WorkLocation s = new ShiftDocument.WorkLocation();
            s.setWorkLocationId(workLocationId);
            s.setLocationName(locationName);
            return s;
        }
    }

    public record RequiredJobRole(Integer requiredEmployees, List<JobRole> jobRoles) {
        static RequiredJobRole from(ShiftDocument.RequiredJobRole s) {
            if (s == null) return null;
            return new RequiredJobRole(s.getRequiredEmployees(), mapList(s.getJobRoles(), JobRole::from));
        }

        ShiftDocument.RequiredJobRole toEntity() {
            ShiftDocument.RequiredJobRole s = new ShiftDocument.RequiredJobRole();
            s.setRequiredEmployees(requiredEmployees);
            s.setJobRoles(mapList(jobRoles, JobRole::toEntity));
            return s;
        }
    }

    public record JobRole(Integer jobRoleId, String roleName) {
        static JobRole from(ShiftDocument.JobRole s) {
            return s == null ? null : new JobRole(s.getJobRoleId(), s.getRoleName());
        }

        ShiftDocument.JobRole toEntity() {
            ShiftDocument.JobRole s = new ShiftDocument.JobRole();
            s.setJobRoleId(jobRoleId);
            s.setRoleName(roleName);
            return s;
        }
    }

    public record ShiftAssignment(
            AssignedEmployee assignedEmployee,
            String assignmentStatus,
            LocalDateTime assignmentDate,
            LocalDateTime checkInDate,
            LocalDateTime checkOutDatetime,
            List<ShiftApproval> shiftApprovals,
            List<SwapRequest> swapRequests
    ) {
        static ShiftAssignment from(ShiftDocument.ShiftAssignment s) {
            if (s == null) return null;
            return new ShiftAssignment(
                    AssignedEmployee.from(s.getAssignedEmployee()),
                    s.getAssignmentStatus(),
                    s.getAssignmentDate(),
                    s.getCheckInDate(),
                    s.getCheckOutDatetime(),
                    mapList(s.getShiftApprovals(), ShiftApproval::from),
                    mapList(s.getSwapRequests(), SwapRequest::from)
            );
        }

        ShiftDocument.ShiftAssignment toEntity() {
            ShiftDocument.ShiftAssignment s = new ShiftDocument.ShiftAssignment();
            s.setAssignedEmployee(assignedEmployee == null ? null : assignedEmployee.toEntity());
            s.setAssignmentStatus(assignmentStatus);
            s.setAssignmentDate(assignmentDate);
            s.setCheckInDate(checkInDate);
            s.setCheckOutDatetime(checkOutDatetime);
            s.setShiftApprovals(mapList(shiftApprovals, ShiftApproval::toEntity));
            s.setSwapRequests(mapList(swapRequests, SwapRequest::toEntity));
            return s;
        }
    }

    public record AssignedEmployee(Integer employeeId, String firstName, String lastName) {
        static AssignedEmployee from(ShiftDocument.AssignedEmployee s) {
            return s == null ? null
                    : new AssignedEmployee(s.getEmployeeId(), s.getFirstName(), s.getLastName());
        }

        ShiftDocument.AssignedEmployee toEntity() {
            ShiftDocument.AssignedEmployee s = new ShiftDocument.AssignedEmployee();
            s.setEmployeeId(employeeId);
            s.setFirstName(firstName);
            s.setLastName(lastName);
            return s;
        }
    }

    public record ShiftApproval(
            AssignedEmployee approverEmployee,
            String decision,
            String approvalComment,
            LocalDateTime decisionDatetime
    ) {
        static ShiftApproval from(ShiftDocument.ShiftApproval s) {
            if (s == null) return null;
            return new ShiftApproval(
                    AssignedEmployee.from(s.getApproverEmployee()),
                    s.getDecision(),
                    s.getApprovalComment(),
                    s.getDecisionDatetime()
            );
        }

        ShiftDocument.ShiftApproval toEntity() {
            ShiftDocument.ShiftApproval s = new ShiftDocument.ShiftApproval();
            s.setApproverEmployee(approverEmployee == null ? null : approverEmployee.toEntity());
            s.setDecision(decision);
            s.setApprovalComment(approvalComment);
            s.setDecisionDatetime(decisionDatetime);
            return s;
        }
    }

    public record SwapRequest(
            AssignedEmployee employeeFrom,
            AssignedEmployee employeeTo,
            String swapStatus,
            LocalDateTime requestDatetime,
            String reason,
            List<SwapApproval> swapApprovals
    ) {
        static SwapRequest from(ShiftDocument.SwapRequest s) {
            if (s == null) return null;
            return new SwapRequest(
                    AssignedEmployee.from(s.getEmployeeFrom()),
                    AssignedEmployee.from(s.getEmployeeTo()),
                    s.getSwapStatus(),
                    s.getRequestDatetime(),
                    s.getReason(),
                    mapList(s.getSwapApprovals(), SwapApproval::from)
            );
        }

        ShiftDocument.SwapRequest toEntity() {
            ShiftDocument.SwapRequest s = new ShiftDocument.SwapRequest();
            s.setEmployeeFrom(employeeFrom == null ? null : employeeFrom.toEntity());
            s.setEmployeeTo(employeeTo == null ? null : employeeTo.toEntity());
            s.setSwapStatus(swapStatus);
            s.setRequestDatetime(requestDatetime);
            s.setReason(reason);
            s.setSwapApprovals(mapList(swapApprovals, SwapApproval::toEntity));
            return s;
        }
    }

    public record SwapApproval(
            AssignedEmployee approverEmployee,
            String decision,
            String swapComment,
            LocalDateTime decisionDatetime
    ) {
        static SwapApproval from(ShiftDocument.SwapApproval s) {
            if (s == null) return null;
            return new SwapApproval(
                    AssignedEmployee.from(s.getApproverEmployee()),
                    s.getDecision(),
                    s.getSwapComment(),
                    s.getDecisionDatetime()
            );
        }

        ShiftDocument.SwapApproval toEntity() {
            ShiftDocument.SwapApproval s = new ShiftDocument.SwapApproval();
            s.setApproverEmployee(approverEmployee == null ? null : approverEmployee.toEntity());
            s.setDecision(decision);
            s.setSwapComment(swapComment);
            s.setDecisionDatetime(decisionDatetime);
            return s;
        }
    }

    private static <S, T> List<T> mapList(List<S> src, Function<S, T> fn) {
        return src == null ? null : src.stream().map(fn).toList();
    }
}
