-- ��������
SELECT u.userID, u.name, b.prodName
     , u.addr, CONCAT(u.mobile1, u.mobile2) AS mobile
  FROM userTbl AS u
 INNER JOIN buyTbl AS b
    ON u.userID = b.userID
 ORDER BY u.userID;

-- �ܺ�����
-- ���θ����� ������ �ѹ��� �������� ���� ȸ������ ��ȸ
SELECT u.userID, u.name
     , u.addr, CONCAT(u.mobile1, u.mobile2) AS mobile
	 , b.prodName
  FROM userTbl AS u
  LEFT OUTER JOIN buyTbl AS b
    ON u.userID = b.userID
 WHERE b.prodName IS NULL
 ORDER BY u.userID;

 SELECT u.userID, u.name
     , u.addr, CONCAT(u.mobile1, u.mobile2) AS mobile
	 , b.prodName
  FROM userTbl AS u
 RIGHT OUTER JOIN buyTbl AS b
    ON u.userID = b.userID
 WHERE b.prodName IS NULL
 ORDER BY u.userID;

-- �л� / ���Ƹ� / �������� ���̺�
-- INNERJOIN
SELECT s.StdID, s.StdName, s.Region
     , r.ClubName, c.ClubRoom
	 , r.RegDate
  FROM stdTbl AS s
 INNER JOIN reginfoTbl AS r
    ON s.StdID = r.StdID
 INNER JOIN clubTbl AS c
    ON c.ClubName = r.ClubName
 
-- OUTERJOIN
SELECT s.StdID, s.StdName, s.Region
     , r.ClubName, c.ClubRoom
	 , r.RegDate
  FROM stdTbl AS s
  LEFT OUTER JOIN reginfoTbl AS r -- std�� �������� club�� �������� ���� ���ȣ, ������� ��ȸ�Ѵ�.
    ON s.StdID = r.StdID
  --LEFT OUTER JOIN clubTbl AS c  -- reg�� �������� �ϹǷ� �ƹ��� �������� ���� ����, ���� ���Ƹ��� ������ �ʴ´�.
  --  ON c.ClubName = r.ClubName
 RIGHT OUTER JOIN clubTbl AS c    -- club�� �������� �ϹǷ� �ƹ��� �������� ���� ����, ���� ���Ƹ��� Room�� ���´�. ��, club�� �Ŀ� ������ �Ǿ����Ƿ�, �������� ���� ���ȣ, ������� �ȳ��´�. 
    ON c.ClubName = r.ClubName

SELECT c.ClubName, c.ClubRoom, r.Id, r.RegDate, s.StdName
  FROM clubTbl AS c
  LEFT OUTER JOIN reginfoTbl AS r -- ���� : clubTbl(club�� ���� ���´�. �ƹ��� �������� ���� ����, ������ ����)
    ON r.ClubName = c.ClubName    -- �� ������ ��� ����
 RIGHT OUTER JOIN stdTbl as s     -- ���� : stdTbl(stu�� ���� ���´�. �ƹ� club���� �������� ���� ���ȣ, ������� ���´�. ��, std�� �Ŀ� ������ �Ǿ����Ƿ�, ����, �������Ƹ��� �ȳ��´�.)
    ON r.StdID = s.StdID
  