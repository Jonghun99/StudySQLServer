-- UPDATE
-- Ʈ������ ����
-- �ѹ� Ʈ������ �ɸ��� �ٸ���� ���ٸ���. �� COMMIT�� �ؾ���
BEGIN TRANSACTION;

UPDATE testTbl
   SET userName = '�����'
 WHERE Id= 2;

UPDATE testTbl
   SET userName = '�����'
     , addr = '�λ�'
 WHERE Id = 4;

SELECT * FROM testTbl;

COMMIT;   -- BEGIN TR, ����, COMMIT or (�ߵǾ������)
ROLLBACK; -- BEGIN TR, ����, ROLLBACK  (�߸��Ǿ������)

TRUNCATE TABLE testTbl; -- ������ ���θ� �����ϰ� ID 1���� �ٽý���