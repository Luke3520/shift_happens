import { test, expect } from '@playwright/test';
import { API_URL as api_url, loginAndGetToken } from '../pages/helper/api-helpers';

test.describe('Audit Log API', () => {
  const email = process.env.TEST_ADMIN_EMAIL || 'admin@shift.dk';
  const password = process.env.TEST_USER_PASSWORD || 'password123';
  let adminToken: string;

  const authHeader = () => ({ Authorization: `Bearer ${adminToken}` });

  test.beforeAll(async ({ request }) => {
    const loginResponse = await loginAndGetToken(request, email, password);
    // Verify it's an admin login
    expect(['Administrator', 'ADMINISTRATOR']).toContain(loginResponse.roleName);
    adminToken = loginResponse.token;
    expect(adminToken).toBeTruthy();
  });

  test('should get audit logs as admin', async ({ request }) => {
    const response = await request.get(`${api_url}/auditlogs`, {
      headers: authHeader()
    });

    expect(response.status()).toBe(200);
    expect(response.headers()['content-type']).toContain('application/json');
    
    const logs = await response.json();
    expect(Array.isArray(logs)).toBeTruthy();
  });
});
