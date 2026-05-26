import { test, expect } from '@playwright/test';
import { API_URL, login, authHeaders, DEFAULT_ADMIN_EMAIL, DEFAULT_PASSWORD } from '../pages/helper/api-helpers';

test.describe('Database Views API', () => {
  let adminToken: string;
  let adminEmployeeId: number;
  const api_url = API_URL;

  test.beforeAll(async ({ request }) => {
    const loginResponse = await login(request, DEFAULT_ADMIN_EMAIL, DEFAULT_PASSWORD);
    adminToken = loginResponse.token;
    adminEmployeeId = loginResponse.employeeId;
  });

  function authHeader() {
    return authHeaders(adminToken);
  }

  test.describe('Employee Shift Overview View', () => {
    test('should fetch all employee shift overviews', async ({ request }) => {
      const res = await request.get(`${api_url}/views/employee-shift-overview`, { headers: authHeader() });
      expect(res.status()).toBe(200);
      const data = await res.json();
      expect(Array.isArray(data)).toBe(true);
    });

    test('should fetch employee shift overview by employee ID', async ({ request }) => {
      const res = await request.get(`${api_url}/views/employee-shift-overview/employee/${adminEmployeeId}`, { headers: authHeader() });
      expect(res.status()).toBe(200);
      const data = await res.json();
      expect(Array.isArray(data)).toBe(true);
    });
  });

  test.describe('Employee Leave Overview View', () => {
    test('should fetch all employee leave overviews', async ({ request }) => {
      const res = await request.get(`${api_url}/views/employee-leave-overview`, { headers: authHeader() });
      expect(res.status()).toBe(200);
      const data = await res.json();
      expect(Array.isArray(data)).toBe(true);
    });

    test('should fetch employee leave overview by employee ID', async ({ request }) => {
      const res = await request.get(`${api_url}/views/employee-leave-overview/employee/${adminEmployeeId}`, { headers: authHeader() });
      expect(res.status()).toBe(200);
      const data = await res.json();
      expect(Array.isArray(data)).toBe(true);
    });

    test('should fetch employee leave overview by status', async ({ request }) => {
      const res = await request.get(`${api_url}/views/employee-leave-overview/status/PENDING`, { headers: authHeader() });
      expect(res.status()).toBe(200);
      const data = await res.json();
      expect(Array.isArray(data)).toBe(true);
    });

    test('should fetch employee leave overview by leave type name', async ({ request }) => {
      // First get a valid leave type name if possible, else use a placeholder
      const res = await request.get(`${api_url}/views/employee-leave-overview/leave-type/Vacation`, { headers: authHeader() });
      expect(res.status()).toBe(200);
      const data = await res.json();
      expect(Array.isArray(data)).toBe(true);
    });
  });
});
