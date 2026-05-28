import { test, expect } from '@playwright/test';
import { API_URL as api_url, login, randomLetters } from '../pages/helper/api-helpers';

test.describe('Leave API', () => {
  const email = process.env.TEST_ADMIN_EMAIL || 'admin@shift.dk';
  const password = process.env.TEST_USER_PASSWORD || 'password123';
  let adminToken: string;
  let adminEmployeeId: number;

  const authHeader = () => ({ Authorization: `Bearer ${adminToken}` });

  test.beforeAll(async ({ request }) => {
    const loginResponse = await login(request, email, password);
    expect(['Administrator', 'ADMINISTRATOR']).toContain(loginResponse.roleName);
    adminToken = loginResponse.token;
    adminEmployeeId = loginResponse.employeeId;
    expect(adminToken).toBeTruthy();
    expect(adminEmployeeId).toBeDefined();
  });

  test('should perform full LeaveType CRUD lifecycle', async ({ request }) => {
    // 1. Get all leavetypes
    const getAllRes = await request.get(`${api_url}/leavetypes`, { headers: authHeader() });
    expect(getAllRes.status()).toBe(200);

    // 2. Create (POST)
    const typeName = `Type-${randomLetters(6)}`;
    const createRes = await request.post(`${api_url}/leavetypes`, {
      headers: authHeader(),
      data: {
        leaveTypeName: typeName,
        leaveTypeDescription: 'Test Description',
        requiresApproval: true,
        isPaidLeave: true
      }
    });
    expect(createRes.status()).toBe(201);
    const createdType = await createRes.json();
    const typeId = createdType.leaveTypeId;

    // 3. Get by ID (GET)
    const getRes = await request.get(`${api_url}/leavetypes/${typeId}`, { headers: authHeader() });
    expect(getRes.status()).toBe(200);
    expect((await getRes.json()).leaveTypeName).toBe(typeName);

    // 4. Update (PUT)
    const updatedName = `${typeName}-Updated`;
    const updateRes = await request.put(`${api_url}/leavetypes/${typeId}`, {
      headers: authHeader(),
      data: {
        leaveTypeName: updatedName,
        leaveTypeDescription: 'Updated Description',
        requiresApproval: false,
        isPaidLeave: false
      }
    });
    expect(updateRes.status()).toBe(200);
    expect((await updateRes.json()).leaveTypeName).toBe(updatedName);

    // 5. Delete (DELETE)
    const deleteRes = await request.delete(`${api_url}/leavetypes/${typeId}`, { headers: authHeader() });
    expect(deleteRes.status()).toBe(204);

    // 6. Verify Delete
    const verifyDeleteRes = await request.get(`${api_url}/leavetypes/${typeId}`, { headers: authHeader() });
    expect(verifyDeleteRes.status()).toBe(404);
  });

  test('should perform full LeaveRequest CRUD lifecycle', async ({ request }) => {
    // Setup: Create a LeaveType first
    const typeRes = await request.post(`${api_url}/leavetypes`, {
      headers: authHeader(),
      data: { leaveTypeName: `ReqType-${randomLetters(4)}`, requiresApproval: true, isPaidLeave: true }
    });
    const typeId = (await typeRes.json()).leaveTypeId;

    // 1. Get all (List)
    const getAllRes = await request.get(`${api_url}/leaverequests`, { headers: authHeader() });
    expect(getAllRes.status()).toBe(200);

    // 2. Create (POST)
    const createRes = await request.post(`${api_url}/leaverequests`, {
      headers: authHeader(),
      data: {
        employeeId: adminEmployeeId,
        leaveTypeId: typeId,
        startDate: '2026-06-01',
        endDate: '2026-06-05',
        requestStatus: 'PENDING',
        reason: 'Vacation',
        requestedDatetime: new Date().toISOString()
      }
    });
    expect(createRes.status()).toBe(201);
    const createdReq = await createRes.json();
    const reqId = createdReq.leaveRequestId;

    // 3. Get by ID (GET)
    const getRes = await request.get(`${api_url}/leaverequests/${reqId}`, { headers: authHeader() });
    expect(getRes.status()).toBe(200);
    expect((await getRes.json()).leaveRequestId).toBe(reqId);

    // 4. Update (PATCH)
    const patchRes = await request.patch(`${api_url}/leaverequests/${reqId}`, {
      headers: authHeader(),
      data: { reason: 'Updated Vacation Reason' }
    });
    expect(patchRes.status()).toBe(200);
    expect((await patchRes.json()).reason).toBe('Updated Vacation Reason');

    // 5. Delete (DELETE)
    const deleteRes = await request.delete(`${api_url}/leaverequests/${reqId}`, { headers: authHeader() });
    expect(deleteRes.status()).toBe(204);

    // 6. Verify Delete
    const verifyDeleteRes = await request.get(`${api_url}/leaverequests/${reqId}`, { headers: authHeader() });
    expect(verifyDeleteRes.status()).toBe(404);

    // Cleanup: Delete LeaveType
    await request.delete(`${api_url}/leavetypes/${typeId}`, { headers: authHeader() });
  });

  test('should perform full LeaveApproval CRUD lifecycle', async ({ request }) => {
    // Setup: Create LeaveType and LeaveRequest
    const typeRes = await request.post(`${api_url}/leavetypes`, {
      headers: authHeader(),
      data: { leaveTypeName: `AppType-${randomLetters(4)}`, requiresApproval: true, isPaidLeave: true }
    });
    const typeId = (await typeRes.json()).leaveTypeId;

    const reqRes = await request.post(`${api_url}/leaverequests`, {
      headers: authHeader(),
      data: {
        employeeId: adminEmployeeId,
        leaveTypeId: typeId,
        startDate: '2026-07-01',
        endDate: '2026-07-05',
        requestStatus: 'PENDING',
        reason: 'Approval Test',
        requestedDatetime: new Date().toISOString()
      }
    });
    const reqId = (await reqRes.json()).leaveRequestId;

    // 1. Get all approvals
    const getAllRes = await request.get(`${api_url}/leaveapprovals`, { headers: authHeader() });
    expect(getAllRes.status()).toBe(200);

    // 2. Create Approval (POST)
    const createRes = await request.post(`${api_url}/leaveapprovals`, {
      headers: authHeader(),
      data: {
        leaveRequestId: reqId,
        approverEmployeeId: adminEmployeeId,
        decision: 'APPROVED',
        leaveComment: 'Enjoy your leave',
        decisionDatetime: new Date().toISOString()
      }
    });
    expect(createRes.status()).toBe(201);
    const createdApp = await createRes.json();
    const appId = createdApp.leaveApprovalId;

    // 3. Get by ID (GET)
    const getRes = await request.get(`${api_url}/leaveapprovals/${appId}`, { headers: authHeader() });
    expect(getRes.status()).toBe(200);
    expect((await getRes.json()).leaveApprovalId).toBe(appId);

    // 4. Get by Request ID (GET /request/{id})
    const getByReqRes = await request.get(`${api_url}/leaveapprovals/request/${reqId}`, { headers: authHeader() });
    expect(getByReqRes.status()).toBe(200);
    const approvals: { leaveApprovalId: number }[] = await getByReqRes.json();
    expect(Array.isArray(approvals)).toBeTruthy();
    expect(approvals.some((a) => a.leaveApprovalId === appId)).toBeTruthy();

    // 5. Update Approval (PUT)
    const updateRes = await request.put(`${api_url}/leaveapprovals/${appId}`, {
      headers: authHeader(),
      data: {
        leaveRequestId: reqId,
        approverEmployeeId: adminEmployeeId,
        decision: 'REJECTED',
        leaveComment: 'Changed mind',
        decisionDatetime: new Date().toISOString()
      }
    });
    expect(updateRes.status()).toBe(200);
    expect((await updateRes.json()).decision).toBe('REJECTED');

    // 6. Delete Approval (DELETE)
    const deleteRes = await request.delete(`${api_url}/leaveapprovals/${appId}`, { headers: authHeader() });
    expect(deleteRes.status()).toBe(204);

    // 7. Verify Delete
    const verifyDeleteRes = await request.get(`${api_url}/leaveapprovals/${appId}`, { headers: authHeader() });
    expect(verifyDeleteRes.status()).toBe(404);

    // Cleanup
    await request.delete(`${api_url}/leaverequests/${reqId}`, { headers: authHeader() });
    await request.delete(`${api_url}/leavetypes/${typeId}`, { headers: authHeader() });
  });

  test('should perform full LeaveLedger CRUD lifecycle', async ({ request }) => {
    // Setup: Create LeaveType
    const typeRes = await request.post(`${api_url}/leavetypes`, {
      headers: authHeader(),
      data: { leaveTypeName: `LedgType-${randomLetters(4)}`, requiresApproval: true, isPaidLeave: true }
    });
    const typeId = (await typeRes.json()).leaveTypeId;

    // 1. Get all (List)
    const getAllRes = await request.get(`${api_url}/leaveledgers`, { headers: authHeader() });
    expect(getAllRes.status()).toBe(200);

    // 2. Create (POST)
    const createRes = await request.post(`${api_url}/leaveledgers`, {
      headers: authHeader(),
      data: {
        employeeId: adminEmployeeId,
        leaveTypeId: typeId,
        changeAmountDays: 10,
        transactionType: 'CREDIT',
        referenceEntityType: 'MANUAL',
        referenceEntityId: 0,
        transactionDatetime: new Date().toISOString()
      }
    });
    expect(createRes.status()).toBe(201);
    const createdLedger = await createRes.json();
    const ledgerId = createdLedger.leaveLedgerId;

    // 3. Get by ID (GET)
    const getRes = await request.get(`${api_url}/leaveledgers/${ledgerId}`, { headers: authHeader() });
    expect(getRes.status()).toBe(200);
    expect((await getRes.json()).leaveLedgerId).toBe(ledgerId);

    // 4. Update (PUT)
    const updateRes = await request.put(`${api_url}/leaveledgers/${ledgerId}`, {
      headers: authHeader(),
      data: {
        employeeId: adminEmployeeId,
        leaveTypeId: typeId,
        changeAmountDays: 5,
        transactionType: 'DEBIT',
        referenceEntityType: 'MANUAL_UPDATE',
        referenceEntityId: 1,
        transactionDatetime: new Date().toISOString()
      }
    });
    expect(updateRes.status()).toBe(200);
    const updated = await updateRes.json();
    expect(updated.changeAmountDays).toBe(5);
    expect(updated.transactionType).toBe('DEBIT');

    // 5. Delete (DELETE) - SKIP: Ledger entries are immutable by database triggers
    /*
    const deleteRes = await request.delete(`${api_url}/leaveledgers/${ledgerId}`, { headers: authHeader() });
    expect(deleteRes.status()).toBe(204);

    // 6. Verify Delete
    const verifyDeleteRes = await request.get(`${api_url}/leaveledgers/${ledgerId}`, { headers: authHeader() });
    expect(verifyDeleteRes.status()).toBe(404);
    */

    // Cleanup
    await request.delete(`${api_url}/leavetypes/${typeId}`, { headers: authHeader() });
  });
});
