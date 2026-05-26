/**
 * Shift Assignment — End-to-End tests
 *
 * Drives the Shift Assignment list and create/delete UI in a real browser, through the
 * ShiftAssignmentPage page object. Unlike the shift-swap / shift-approval E2E specs (which have no
 * dedicated UI and fall back to browser-authenticated API calls), this feature has a real form at
 * /shift-assignments, so the flow is fully UI-driven.
 *
 * The suite seeds an authenticated admin session into localStorage (same convention as
 * shift.e2e.spec.ts), provisions a unique employee + open shift via the API so they are selectable
 * in the form, then creates and deletes an assignment through the browser. Everything created is
 * cleaned up in afterAll (FK-safe order).
 */

import { test, expect } from '@playwright/test';
import { API_URL, login, authHeaders, futureShiftWindow, type LoginResponse } from '../pages/helper/api-helpers';
import { seedAuthState } from '../pages/helper/browser-auth';
import { ShiftAssignmentPage } from '../pages/ShiftAssignmentPage';

const ADMIN_EMAIL = process.env.TEST_ADMIN_EMAIL || 'admin@shift.dk';
const TEST_EMPLOYEE_PASSWORD = process.env.TEST_EMPLOYEE_PASSWORD || 'TestPass123';

test.describe.serial('Shift Assignment E2E', () => {
  let adminSession: LoginResponse;
  let employeeId = 0;
  let shiftId = 0;
  let employeeFullName = '';
  let shiftName = '';

  const employeeIds: number[] = [];
  const shiftIds: number[] = [];

  test.beforeAll(async ({ request }) => {
    adminSession = await login(request, ADMIN_EMAIL);
    expect(adminSession.roleName).toBe('Administrator');

    const suffix = Date.now().toString(36);
    const lastName = `Uitest${suffix}`;
    employeeFullName = `Asgn ${lastName}`;
    const email = `sa.e2e.${suffix}@shifthappens.dk`;

    const empRes = await request.post(`${API_URL}/employees`, {
      headers: authHeaders(adminSession.token),
      data: {
        employeeNumber: `EMP-SAE2E-${suffix}`,
        firstName: 'Asgn',
        lastName,
        userRole: 'Employee',
        email,
        loginPassword: TEST_EMPLOYEE_PASSWORD,
        phoneNumber: '+45 12345678',
        hireDate: '2026-01-15',
        birthDate: '1999-01-01',
        employmentStatus: 'ACTIVE',
        primaryWorkLocationId: 1,
      },
    });
    expect(empRes.status()).toBe(201);
    employeeId = (await empRes.json()).employeeId as number;
    employeeIds.push(employeeId);

    shiftName = `E2E Assign ${suffix}`;
    const { startDatetime, endDatetime } = futureShiftWindow(11);
    const shiftRes = await request.post(`${API_URL}/shifts`, {
      headers: authHeaders(adminSession.token),
      data: {
        departmentId: 1,
        workLocationId: 1,
        shiftName,
        startDatetime,
        endDatetime,
        shiftStatus: 'Open',
      },
    });
    expect(shiftRes.status()).toBe(201);
    shiftId = (await shiftRes.json()).shiftId as number;
    shiftIds.push(shiftId);
  });

  test.afterAll(async ({ request }) => {
    let token = (await login(request, ADMIN_EMAIL)).token;
    const del = async (path: string) => {
      let res = await request.delete(`${API_URL}${path}`, { headers: authHeaders(token) });
      if (res.status() === 401 || res.status() === 403) {
        token = (await login(request, ADMIN_EMAIL)).token;
        res = await request.delete(`${API_URL}${path}`, { headers: authHeaders(token) });
      }
      return res.status();
    };

    // Defensively remove any assignment still referencing our employee before deleting the shift.
    const listRes = await request.get(`${API_URL}/shiftassignments`, { headers: authHeaders(token) });
    if (listRes.status() === 200) {
      const assignments = (await listRes.json()) as { shiftAssignmentId: number; employeeId: number }[];
      for (const a of assignments.filter((a) => a.employeeId === employeeId)) {
        await del(`/shiftassignments/${a.shiftAssignmentId}`);
      }
    }
    for (const id of [...shiftIds].reverse()) await del(`/shifts/${id}`);
    for (const id of [...employeeIds].reverse()) await del(`/employees/${id}`);
  });

  // ── E2E-SAA-01 — Create an assignment through the form, see it listed, then delete it ──

  test('E2E-SAA-01 — admin creates an assignment via the UI and then deletes it', async ({ page }) => {
    await seedAuthState(page, adminSession);
    const assignmentPage = new ShiftAssignmentPage(page);

    // 1. The list page loads with a "New assignment" action.
    await assignmentPage.goto();
    await expect(page).not.toHaveURL(/\/login/);
    await expect(assignmentPage.newButton).toBeVisible();

    // 2. Create the assignment through the form (select employee + shift, submit).
    await assignmentPage.createAssignment(employeeFullName, shiftName);

    // 3. On success the form returns to the list, where the new assignment is shown.
    await expect(page).toHaveURL(/\/shift-assignments$/);
    await expect(page.locator('tr', { hasText: employeeFullName }).first()).toBeVisible();

    // 4. Delete it from the list and confirm the row is gone.
    await assignmentPage.deleteAssignment(employeeFullName);
    await expect(page.locator('tr', { hasText: employeeFullName })).toHaveCount(0);
  });
});
