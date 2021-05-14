-- ����(���̺� ��ġ��)

SELECT StdName, Region FROM stdTbl
 UNION 
SELECT ClubName, ClubRoom FROM clubTbl;

SELECT CAST(Id AS VARCHAR), StdID FROM reginfoTbl -- ������ ���ƾ� �Ѵ�
 UNION
SELECT ClubName, ClubRoom FROM clubTbl;

SELECT StdName, Region FROM stdTbl
 UNION ALL
SELECT ClubName, ClubRoom FROM clubTbl;

-- exepct
SELECT name, CONCAT(mobile1, mobile2) AS mobile FROM userTbl
EXCEPT
SELECT name, CONCAT(mobile1, mobile2) AS mobile FROM userTbl
WHERE mobile1 IS NOT NULL;

-- intersect
SELECT name, CONCAT(mobile1, mobile2) AS mobile FROM userTbl
INTERSECT
SELECT name, CONCAT(mobile1, mobile2) AS mobile FROM userTbl
WHERE mobile1 IS NOT NULL;