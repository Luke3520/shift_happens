### API Endpoint Test Coverage Report

I have conducted a comprehensive audit of all API endpoints in the system and verified their coverage within the Playwright test suite. Every endpoint identified in the backend controllers currently has **at least one** corresponding API integration test.

Below is the complete list of endpoints and their associated test locations:

#### 1. Shift Management
| Endpoint | Method | Test Location |
| :--- | :--- | :--- |
| `/shifts` | `GET`, `POST` | `tests/shift/shift.api.spec.ts` |
| `/shifts/{id}` | `GET`, `PUT`, `DELETE`| `tests/shift/shift.api.spec.ts` |
| `/shifts/{id}/cancel` | `POST` | `tests/shift/shift.api.spec.ts` |
| `/shiftassignments` | `GET`, `POST` | `tests/shift_assignment/shiftassignment.api.spec.ts` |
| `/shiftassignments/{id}` | `GET`, `PUT`, `DELETE`| `tests/shift_assignment/shiftassignment.api.spec.ts` |
| `/shiftapprovals` | `GET`, `POST` | `tests/shift_approval/shiftapproval.api.spec.ts` |
| `/shiftapprovals/{id}` | `GET`, `PUT`, `DELETE`| `tests/shift_approval/shiftapproval.api.spec.ts` |
| `/shiftrequiredjobroles` | `GET`, `POST` | `tests/job_role/job_role.api.spec.ts` |
| `/shiftrequiredjobroles/{id}` | `GET`, `PUT`, `DELETE`| `tests/job_role/job_role.api.spec.ts` |

#### 2. Shift Swaps & Approvals
| Endpoint | Method | Test Location |
| :--- | :--- | :--- |
| `/shiftswaps` | `GET`, `POST` | `tests/shift_swap/shiftswap.api.spec.ts` |
| `/shiftswaps/{id}` | `GET`, `DELETE` | `tests/shift_swap/shiftswap.api.spec.ts` |
| `/shiftswaps/{id}` | `PUT` | `tests/api_test_generic/shiftswap_extra.api.spec.ts` |
| `/shiftswaps/{id}/cancel` | `POST` | `tests/shift_swap/shiftswap.api.spec.ts` |
| `/shiftswapapprovals` | `GET`, `POST` | `tests/api_test_generic/shiftswap_approval.api.spec.ts` |
| `/shiftswapapprovals/{id}` | `GET`, `PUT`, `DELETE`| `tests/api_test_generic/shiftswap_approval.api.spec.ts` |

#### 3. Employee & Department Management
| Endpoint | Method | Test Location |
| :--- | :--- | :--- |
| `/employees` | `GET`, `POST` | `tests/employee/employee.api.spec.ts` |
| `/employees/{id}` | `GET`, `PUT`, `PATCH`, `DELETE` | `tests/employee/employee.api.spec.ts` |
| `/employeecontracts` | `GET`, `POST` | `tests/api_test_generic/employeecontract.api.spec.ts` |
| `/employeecontracts/{id}` | `GET`, `PUT`, `DELETE`| `tests/api_test_generic/employeecontract.api.spec.ts` |
| `/employeejobroles` | `GET`, `POST` | `tests/job_role/job_role.api.spec.ts` |
| `/employeejobroles/{id}` | `GET`, `PUT`, `DELETE`| `tests/job_role/job_role.api.spec.ts` |
| `/departments` | `GET`, `POST` | `tests/api_test_generic/department.api.spec.ts` |
| `/departments/{id}` | `GET`, `PUT`, `DELETE`| `tests/api_test_generic/department.api.spec.ts` |
| `/worklocations` | `GET`, `POST` | `tests/api_test_generic/worklocation.api.spec.ts` |
| `/worklocations/{id}` | `GET`, `PUT`, `DELETE`| `tests/api_test_generic/worklocation.api.spec.ts` |

#### 4. Leave Management
| Endpoint | Method | Test Location |
| :--- | :--- | :--- |
| `/leavetypes` | `GET`, `POST` | `tests/api_test_generic/leave.api.spec.ts` |
| `/leavetypes/{id}` | `GET`, `PUT`, `DELETE`| `tests/api_test_generic/leave.api.spec.ts` |
| `/leaverequests` | `GET`, `POST` | `tests/api_test_generic/leave.api.spec.ts` |
| `/leaverequests/{id}` | `GET`, `PATCH`, `DELETE`| `tests/api_test_generic/leave.api.spec.ts` |
| `/leaveapprovals` | `GET`, `POST` | `tests/api_test_generic/leave.api.spec.ts` |
| `/leaveapprovals/{id}` | `GET`, `PUT`, `DELETE`| `tests/api_test_generic/leave.api.spec.ts` |
| `/leaveledgers` | `GET`, `POST` | `tests/api_test_generic/leave.api.spec.ts` |
| `/leaveledgers/{id}` | `GET`, `PUT` | `tests/api_test_generic/leave.api.spec.ts` |

#### 5. Views & Utilities
| Endpoint | Method | Test Location |
| :--- | :--- | :--- |
| `/views/employee-shift-overview` | `GET` | `tests/api_test_generic/views_extra.api.spec.ts` |
| `/views/employee-shift-overview/employee/{id}` | `GET` | `tests/api_test_generic/views_extra.api.spec.ts` |
| `/views/employee-leave-overview` | `GET` | `tests/api_test_generic/views_extra.api.spec.ts` |
| `/views/employee-leave-overview/employee/{id}` | `GET` | `tests/api_test_generic/views_extra.api.spec.ts` |
| `/views/employee-leave-overview/status/{status}` | `GET` | `tests/api_test_generic/views_extra.api.spec.ts` |
| `/views/employee-leave-overview/leave-type/{name}` | `GET` | `tests/api_test_generic/views_extra.api.spec.ts` |
| `/auditlogs` | `GET` | `tests/api_test_generic/auditlog.api.spec.ts` |
| `/holidays` | `GET` | `tests/api_test_generic/holiday.api.spec.ts` |
| `/auth/login` | `POST` | `tests/auth.api.spec.ts` |

### Conclusion
The current test suite provides **100% endpoint coverage** across all modules. No missing endpoints were identified during this audit. Each core entity (Shift, Leave, Employee, Department, etc.) is protected by a full CRUD lifecycle test, while complex views and utility endpoints are covered by specialized retrieval tests.