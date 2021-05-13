-- UPDATE
-- 트렌젝션 시작
-- 한번 트렌젝션 걸리면 다른사람 접근못함. 꼭 COMMIT을 해야함
BEGIN TRANSACTION;

UPDATE testTbl
   SET userName = '성명건'
 WHERE Id= 2;

UPDATE testTbl
   SET userName = '성명건'
     , addr = '부산'
 WHERE Id = 4;

SELECT * FROM testTbl;

COMMIT;   -- BEGIN TR, 실행, COMMIT or (잘되었을경우)
ROLLBACK; -- BEGIN TR, 실행, ROLLBACK  (잘못되었을경우)

TRUNCATE TABLE testTbl; -- 데이터 전부를 삭제하고 ID 1부터 다시시작