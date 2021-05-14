-- �����Լ�(RANK() OVER())

SELECT name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL
 ORDER BY height DESC;

SELECT ROW_NUMBER() OVER(ORDER BY height DESC) AS 'Ű����' -- ������ ó������
     , name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL;

SELECT RANK() OVER(ORDER BY height DESC) AS 'Ű����'       -- ������ ó������
     , name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL;

SELECT DENSE_RANK() OVER(ORDER BY height DESC) AS 'Ű����' -- �����ڸ� 1������
     , name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL;

SELECT DENSE_RANK() OVER(PARTITION BY addr ORDER BY height DESC) AS 'Ű����' -- �������� ����
     , name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL;

 -- �����Լ� ���� ����

 SELECT userID, SUM(price * amount) AS '����ں����űݾ�'
  FROM buyTbl
 GROUP BY userID
 ORDER BY SUM(price * amount)

 SELECT RANK() OVER(ORDER BY SUM(price * amount) DESC) AS '���ż���'
      , userID, SUM(price * amount) AS '����ں����űݾ�'
   FROM buyTbl
  GROUP BY userID