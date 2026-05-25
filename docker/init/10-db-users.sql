-- ============================================================
-- 10-db-users.sql — Database-level users & privileges
-- ------------------------------------------------------------
-- Defines the four required users via MySQL roles. Idempotent:
-- safe to run on a fresh DB or re-run on an existing one.
--
--   1. app_user      — the CRUD application user (minimum privileges)
--   2. sh_admin      — full database admin
--   3. sh_readonly   — read-only (SELECT on everything)
--   4. sh_restricted — read-only, but CANNOT see salary or passwords
--
-- NOTE: demo passwords only (school project). Change for real use.
-- ============================================================
USE shift_happens;

-- ============================================================
-- ROLES
-- ============================================================
CREATE ROLE IF NOT EXISTS app_crud_role, admin_role, readonly_role, restricted_role;

-- ------------------------------------------------------------
-- 1) APP role — minimum privileges the CRUD app needs.
--    CRUD on operational tables; audit_log is read-only (it is
--    populated by triggers, never written by the app); views are
--    read-only; NO DDL, NO admin, NO user management.
-- ------------------------------------------------------------
GRANT USAGE, SHOW VIEW ON shift_happens.* TO app_crud_role;

GRANT SELECT                         ON shift_happens.audit_log               TO app_crud_role;
GRANT SELECT, INSERT                 ON shift_happens.leave_ledger            TO app_crud_role; -- append-only ledger
GRANT SELECT, INSERT, UPDATE, DELETE ON shift_happens.department              TO app_crud_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON shift_happens.employee                TO app_crud_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON shift_happens.employee_contract       TO app_crud_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON shift_happens.employee_job_role       TO app_crud_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON shift_happens.job_role                TO app_crud_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON shift_happens.leave_approval          TO app_crud_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON shift_happens.leave_request           TO app_crud_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON shift_happens.leave_type              TO app_crud_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON shift_happens.shift                   TO app_crud_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON shift_happens.shift_approval          TO app_crud_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON shift_happens.shift_assignment        TO app_crud_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON shift_happens.shift_required_job_role TO app_crud_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON shift_happens.shift_swap              TO app_crud_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON shift_happens.shift_swap_approval     TO app_crud_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON shift_happens.work_location           TO app_crud_role;
-- read models
GRANT SELECT ON shift_happens.vw_employee_leave_overview TO app_crud_role;
GRANT SELECT ON shift_happens.vw_employee_overview       TO app_crud_role;
GRANT SELECT ON shift_happens.vw_employee_shift_overview TO app_crud_role;
GRANT SELECT ON shift_happens.vw_leave_balance           TO app_crud_role;
GRANT SELECT ON shift_happens.vw_pending_leave_requests  TO app_crud_role;
GRANT SELECT ON shift_happens.vw_shift_schedule          TO app_crud_role;

-- ------------------------------------------------------------
-- 2) ADMIN role — full privileges over the database.
-- ------------------------------------------------------------
GRANT ALL PRIVILEGES ON shift_happens.* TO admin_role WITH GRANT OPTION;

-- ------------------------------------------------------------
-- 3) READ-ONLY role — SELECT on every table and view.
-- ------------------------------------------------------------
GRANT SELECT, SHOW VIEW ON shift_happens.* TO readonly_role;

-- ------------------------------------------------------------
-- 4) RESTRICTED-READ role — read-only, but cannot see sensitive
--    columns. Implemented with column-level grants: NO table-wide
--    SELECT on employee / employee_contract, only the allowed
--    columns (login_password and salary_amount are withheld).
--    Full SELECT on everything else.
-- ------------------------------------------------------------
GRANT SHOW VIEW ON shift_happens.* TO restricted_role;
-- employee: every column EXCEPT login_password
GRANT SELECT (employee_id, employee_number, first_name, last_name, email,
              phone_number, hire_date, employment_status,
              primary_work_location_id, user_role)
    ON shift_happens.employee TO restricted_role;
-- employee_contract: every column EXCEPT salary_amount
GRANT SELECT (contract_id, employee_id, department_id, contract_type,
              start_date, end_date, weekly_hours, is_active)
    ON shift_happens.employee_contract TO restricted_role;
-- all other tables: full SELECT
GRANT SELECT ON shift_happens.audit_log               TO restricted_role;
GRANT SELECT ON shift_happens.department              TO restricted_role;
GRANT SELECT ON shift_happens.employee_job_role       TO restricted_role;
GRANT SELECT ON shift_happens.job_role                TO restricted_role;
GRANT SELECT ON shift_happens.leave_approval          TO restricted_role;
GRANT SELECT ON shift_happens.leave_ledger            TO restricted_role;
GRANT SELECT ON shift_happens.leave_request           TO restricted_role;
GRANT SELECT ON shift_happens.leave_type              TO restricted_role;
GRANT SELECT ON shift_happens.shift                   TO restricted_role;
GRANT SELECT ON shift_happens.shift_approval          TO restricted_role;
GRANT SELECT ON shift_happens.shift_assignment        TO restricted_role;
GRANT SELECT ON shift_happens.shift_required_job_role TO restricted_role;
GRANT SELECT ON shift_happens.shift_swap              TO restricted_role;
GRANT SELECT ON shift_happens.shift_swap_approval     TO restricted_role;
GRANT SELECT ON shift_happens.work_location           TO restricted_role;
-- views (verified not to expose salary/password)
GRANT SELECT ON shift_happens.vw_employee_leave_overview TO restricted_role;
GRANT SELECT ON shift_happens.vw_employee_overview       TO restricted_role;
GRANT SELECT ON shift_happens.vw_employee_shift_overview TO restricted_role;
GRANT SELECT ON shift_happens.vw_leave_balance           TO restricted_role;
GRANT SELECT ON shift_happens.vw_pending_leave_requests  TO restricted_role;
GRANT SELECT ON shift_happens.vw_shift_schedule          TO restricted_role;

-- ============================================================
-- USERS  (each gets one role as its default, so privileges are
-- active immediately on login without an explicit SET ROLE)
-- ============================================================
-- app_user's password must match APP_DB_PASSWORD in .env (the docker-compose
-- db healthcheck logs in as app_user). Keep them in sync if you change it.
CREATE USER IF NOT EXISTS 'app_user'@'%'      IDENTIFIED BY 'apppassword';
CREATE USER IF NOT EXISTS 'sh_admin'@'%'      IDENTIFIED BY 'admin_password';
CREATE USER IF NOT EXISTS 'sh_readonly'@'%'   IDENTIFIED BY 'readonly_password';
CREATE USER IF NOT EXISTS 'sh_restricted'@'%' IDENTIFIED BY 'restricted_password';

GRANT app_crud_role    TO 'app_user'@'%';
GRANT admin_role       TO 'sh_admin'@'%';
GRANT readonly_role    TO 'sh_readonly'@'%';
GRANT restricted_role  TO 'sh_restricted'@'%';

SET DEFAULT ROLE app_crud_role   TO 'app_user'@'%';
SET DEFAULT ROLE admin_role      TO 'sh_admin'@'%';
SET DEFAULT ROLE readonly_role   TO 'sh_readonly'@'%';
SET DEFAULT ROLE restricted_role TO 'sh_restricted'@'%';

FLUSH PRIVILEGES;
