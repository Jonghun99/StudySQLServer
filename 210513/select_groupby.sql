-- GROUP BY
-- ���̵𺰷� ���� � ����� ��ȸ 
SELECT userID, SUM(amount) AS '�ѱ��Ű���'
  FROM buyTbl
 GROUP BY userID;

-- �츮 ���θ����� ���� ������ �� �����
-- ���̵𺰷� ��ȸ�ϰ� �� �ݾ��� ���� ����϶�

SELECT userID, SUM(amount * price) AS '�ѱ��űݾ�'
  FROM buyTbl
 GROUP BY userID
 ORDER BY SUM(amount * price) DESC;

-- �����Լ��� GROUP BY ���� ���� ������, 
-- GROUP BY�� �����Լ� ���� ���� ����
SELECT SUM(amount * price) AS '�ѱ��űݾ�'
  FROM buyTbl

SELECT AVG(price) AS [��ձ��űݾ�] 
  FROM buyTbl;

SELECT * FROM userTbl
 ORDER BY height DESC;

-- ����� ���̺��� Ű�� ���� ū����� ���� ������� ��ȸ
SELECT * FROM userTbl
 WHERE height = 166 OR height = 186; /* X!! */

SELECT name AS '�̸�', height AS 'Ű' FROM userTbl
 WHERE height = (SELECT MAX(height) FROM userTbl)
    OR height = (SELECT MIN(height) FROM userTbl) /* OK */

-- GROUP BY�� ���� ���� HAVING
SELECT userID AS '����ھ��̵�'
     , SUM(price * amount) AS [�ѱ��űݾ�]
  FROM buyTbl
-- WHERE SUM(price * amount) >= 1000 // ����Ұ� GROUP BY �ڿ� �����(HAVING)
 GROUP BY userID
HAVING SUM(Price * amount) >= 1000

-- ���
-- ��ǰ �׷캰�� ����ڰ� �󸶸�ŭ ���Ÿ� �ߴ��� ��ȸ
SELECT groupName
     , userID
     , SUM(price * amount) AS [�ѱ��űݾ�]
  FROM buyTbl
 GROUP BY userID, groupName;

-- �׷캰�� �߰����� ��Ÿ����, �������� ���հ�
SELECT groupName
     , userID
     , SUM(price * amount) AS [�ѱ��űݾ�]
  FROM buyTbl
 GROUP BY ROLLUP(groupName, userID);

-- ID���� �߰����� ��Ÿ����, �������� ���հ�
SELECT groupName
     , userID
     , SUM(price * amount) AS [�ѱ��űݾ�]
  FROM buyTbl
 GROUP BY ROLLUP(userID, groupName);

-- CUBE�� ROLLUP���� �ݴ�� �����ϰ�, �������� �׷캰 ���հ�
SELECT groupName
     , userID
     , SUM(price * amount) AS [�ѱ��űݾ�]
	 , GROUPING_ID(groupName) AS 'SUM1'
	 , GROUPING_ID(userID) AS 'SUM2'
  FROM buyTbl
 GROUP BY CUBE(userID, groupName);

SELECT groupName
     , SUM(price * amount) AS [�ѱ��űݾ�]
	 , GROUPING_ID(groupName) AS 'SUM'
  FROM buyTbl
 GROUP BY CUBE(groupName);