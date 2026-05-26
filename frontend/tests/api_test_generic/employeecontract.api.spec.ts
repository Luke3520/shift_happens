import { test, expect } from '@playwright/test';
import { API_URL as api_url, loginAndGetToken } from '../pages/helper/api-helpers';
import { buildEmployeePayload } from '../pages/helper/employee-helpers';

test.describe('Employee Contract API', () => {
    const email = process.env.TEST_ADMIN_EMAIL || 'admin@shift.dk';
    const password = process.env.TEST_USER_PASSWORD || 'password123';
    let adminToken: string;

    const authHeader = () => ({ Authorization: `Bearer ${adminToken}` });

    test.beforeAll(async ({ request }) => {
        const loginResponse = await loginAndGetToken(request, email, password);
        adminToken = loginResponse.token;
        expect(adminToken).toBeTruthy();
    });

    test('should perform full employee contract lifecycle', async ({ request }) => {
        // 1. Create a test employee
        const employeeResponse = await request.post(`${api_url}/employees`, {
            headers: authHeader(),
            data: buildEmployeePayload()
        });
        expect(employeeResponse.status()).toBe(201);
        const employee = await employeeResponse.json();
        const employeeId = employee.employeeId;

        try {
            // 2. Fetch a department
            const deptResponse = await request.get(`${api_url}/departments`, {
                headers: authHeader()
            });
            expect(deptResponse.status()).toBe(200);
            const departments = await deptResponse.json();
            const departmentId = departments[0].departmentId;

            // 3. Create a contract (POST)
            const contractPayload = {
                employeeId: employeeId,
                departmentId: departmentId,
                contractType: 'FULL_TIME',
                startDate: '2024-01-01',
                endDate: '2024-12-31',
                weeklyHours: 37,
                salaryAmount: 50000,
                isActive: true
            };

            const createResponse = await request.post(`${api_url}/employeecontracts`, {
                headers: authHeader(),
                data: contractPayload
            });
            expect(createResponse.status()).toBe(201);
            const createdContract = await createResponse.json();
            const contractId = createdContract.contractId;
            expect(contractId).toBeDefined();

            // 4. Fetch the contract (GET /{id})
            const getOneResponse = await request.get(`${api_url}/employeecontracts/${contractId}`, {
                headers: authHeader()
            });
            expect(getOneResponse.status()).toBe(200);
            const fetchedContract = await getOneResponse.json();
            expect(fetchedContract.contractId).toBe(contractId);

            // 5. Update the contract (PUT /{id})
            const updatePayload = {
                ...contractPayload,
                contractType: 'PART_TIME',
                weeklyHours: 20
            };
            const updateResponse = await request.put(`${api_url}/employeecontracts/${contractId}`, {
                headers: authHeader(),
                data: updatePayload
            });
            expect(updateResponse.status()).toBe(200);
            const updatedContract = await updateResponse.json();
            expect(updatedContract.contractType).toBe('PART_TIME');

            // 6. Delete the contract (DELETE /{id})
            const deleteResponse = await request.delete(`${api_url}/employeecontracts/${contractId}`, {
                headers: authHeader()
            });
            expect(deleteResponse.status()).toBe(204);

            // 7. Verify deletion
            const verifyDeleteResponse = await request.get(`${api_url}/employeecontracts/${contractId}`, {
                headers: authHeader()
            });
            expect(verifyDeleteResponse.status()).toBe(404);

        } finally {
            // Cleanup: Remove the employee
            await request.delete(`${api_url}/employees/${employeeId}`, {
                headers: authHeader()
            });
        }
    });
});
