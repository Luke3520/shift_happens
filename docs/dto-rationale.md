# Controller DTOs — Rationale

## Requirement

> "Use DTO objects in the controllers — do not expose the models to the outside."
> — Tomas

This document explains why the SQL/JPA controllers were migrated from returning
raw persistence entities to returning DTOs, and the design choices behind it.

## Why DTOs at all

1. **Separation of concerns / encapsulation.**
   A JPA `@Entity` is a *persistence* concern — it maps to a database table.
   An API response is a *contract* concern — it is what clients depend on.
   Returning the entity directly fuses the two: any schema change (renamed
   column, new field, changed relation) instantly becomes a breaking API
   change. The DTO is a stable boundary between the database and the API.

2. **Security — exposure becomes opt-in.**
   A raw entity serializes *every* field, including fields added later.
   With raw entities the team had to scatter `@JsonIgnore` /
   `@JsonProperty(WRITE_ONLY)` annotations onto the persistence model to plug
   leaks. With a DTO, a field only reaches the client if it is explicitly
   declared in the record. Concrete wins in this project:
   - `EmployeeDto.loginPassword` is `WRITE_ONLY` — accepted on create/update,
     never serialized back.
   - `EmployeeContractDto` omits `salaryAmount` entirely, so it cannot leak.

3. **Fail-safe by default.**
   New entity fields stay invisible to the API until a developer consciously
   adds them to the DTO.

## Design choices

| Decision | Rationale |
|---|---|
| One Java `record` per entity | Records are immutable and concise — a DTO by language design. Matches the existing `EmployeeShiftOverviewDto` view pattern, so the codebase stays consistent. |
| `static from(entity)` + `toEntity()` on the DTO | Mapping logic lives in one obvious place, next to the fields. No mapper framework (e.g. MapStruct) — manual mapping is explicit and easy to explain at this project size. |
| One DTO for both request and response | A deliberate trade-off: roughly halves the file count vs. separate request/response DTOs. Limitation: `id` is meaningful on a response but ignored on a create request. |
| Services still operate on entities; only controllers changed | Keeps the migration low-risk. The DTO is purely a web-boundary concern; business logic in the service layer is untouched. |
| Foreign keys stay as scalar ids (`departmentId`, not a nested `Department`) | The entities already use scalar FK columns, so the DTO mirrors them. Also avoids serializing lazy `@ManyToOne` relations, which can cause extra queries or `LazyInitializationException`. |

## Known trade-offs (stated honestly)

- **One DTO for input + output is a compromise.** A stricter design uses
  separate request/response DTOs. We chose simplicity for scope reasons; we
  would split them if create and read fields diverged.
- **Manual mapping has boilerplate** — every field is copied twice. Acceptable
  at 17 entities; at 100+ a mapper framework would be justified.
- **`Optional<XDto>` return types** (Shift, ShiftApproval, etc.) were kept
  as-is to keep the migration behavior-preserving.

## Scope

Migrated: the **17 SQL/JPA controllers** (Employee, Department, Shift,
JobRole, LeaveType, WorkLocation, LeaveRequest, LeaveApproval, ShiftApproval,
ShiftAssignment, ShiftSwap, ShiftSwapApproval, LeaveLedger, EmployeeContract,
EmployeeJobRole, ShiftRequiredJobRole, AuditLog).

Deferred to a later branch: the 12 MongoDB and 13 Neo4j controllers, which
still return `@Document` / `@Node` entities. `AuthController` already uses
POJOs; `MigrationController` and `Neo4jInsightsController` do not expose
entities.
