-- DELETE
-- WHERE�� �Ⱦ��� �������� ���Եȴ�
BEGIN TRAN;

DELETE FROM testTbl
 WHERE Id = 4;

SELECT * FROM testTbl;

DELETE FROM testTbl
 WHERE addr = '����';

DELETE FROM testTbl
 WHERE userName = 'ȫ�浿';

COMMIT;
ROLLBACK;