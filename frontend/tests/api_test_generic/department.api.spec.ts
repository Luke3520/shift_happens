import { test, expect } from '@playwright/test';
import { API_URL as api_url, loginAndGetToken, randomLetters } from '../pages/helper/api-helpers';

test.describe('Department API', () => {
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

  test('should perform full department CRUD lifecycle', async ({ request }) => {
    // 1. Fetch all departments
    const getAllResponse = await request.get(`${api_url}/departments`, {
      headers: authHeader()
    });
    expect(getAllResponse.status()).toBe(200);
    const initialDepartments = await getAllResponse.json();
    expect(Array.isArray(initialDepartments)).toBeTruthy();

    // 2. Create a new department (POST)
    const uniqueName = `Dept-${randomLetters(6)}`;
    const createResponse = await request.post(`${api_url}/departments`, {
      headers: authHeader(),
      data: {
        departmentName: uniqueName,
        isActive: true
      }
    });
    expect(createResponse.status()).toBe(201);
    const createdDept = await createResponse.json();
    expect(createdDept.departmentName).toBe(uniqueName);
    expect(createdDept.departmentId).toBeDefined();
    const deptId = createdDept.departmentId;

    // 3. Fetch the department by ID (GET /{id})
    const getOneResponse = await request.get(`${api_url}/departments/${deptId}`, {
      headers: authHeader()
    });
    expect(getOneResponse.status()).toBe(200);
    const fetchedDept = await getOneResponse.json();
    expect(fetchedDept.departmentId).toBe(deptId);
    expect(fetchedDept.departmentName).toBe(uniqueName);

    // 4. Update the department (PATCH /{id})
    const updatedName = `${uniqueName}-Updated`;
    const patchResponse = await request.patch(`${api_url}/departments/${deptId}`, {
      headers: authHeader(),
      data: {
        departmentName: updatedName
      }
    });
    expect(patchResponse.status()).toBe(200);
    const patchedDept = await patchResponse.json();
    expect(patchedDept.departmentName).toBe(updatedName);

    // 5. Confirm it's been updated (GET /{id} again)
    const verifyUpdateResponse = await request.get(`${api_url}/departments/${deptId}`, {
      headers: authHeader()
    });
    expect(verifyUpdateResponse.status()).toBe(200);
    const verifiedDept = await verifyUpdateResponse.json();
    expect(verifiedDept.departmentName).toBe(updatedName);

    // 6. Delete the department (DELETE /{id})
    const deleteResponse = await request.delete(`${api_url}/departments/${deptId}`, {
      headers: authHeader()
    });
    expect(deleteResponse.status()).toBe(204);

    // 7. Confirm it's been deleted (GET /{id} should return 404 or not be found)
    const verifyDeleteResponse = await request.get(`${api_url}/departments/${deptId}`, {
      headers: authHeader()
    });
    // Assuming the API returns 404 for non-existent entities
    expect(verifyDeleteResponse.status()).toBe(404);
  });
});
