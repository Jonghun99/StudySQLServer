-- ������ �ݾ׿� ���� �ֿ��/���/�Ϲݰ����� �з��ϴ� ������ �ۼ��϶�
-- ���� : 
-- userID, name ��Ÿ����(select from where)
-- inner join ��Ű��
-- sum, group by(�����Լ��� ������ �Ϲ� COLLUMS�� �� ������)
-- left outer join���� userID ���� ǥ��

-- ORDER BY
-- IIF�� NULL��� 0
-- CASE WHEN THEN ���� ��޸ű��

-- CTE�� ���������̺� ���� �ѱ��űݾ� ��ȭǥ���ϱ�

WITH cte_custlevel([����ھ��̵�], [ȸ����], [�ѱ��űݾ�], [�����])
AS
(
	SELECT u.userID AS '����ھ��̵�'
		 , u.name AS 'ȸ����'
		 , IIF(SUM(b.price * b.amount) IS NULL
			   , 0
			   , SUM(b.price * b.amount)) AS '�ѱ��űݾ�' 
		 , CASE 
				WHEN (SUM(b.price * b.amount) >= 1500) THEN '�ֿ����'
				WHEN (SUM(b.price * b.amount) >= 1000) THEN '�����'
				WHEN (SUM(b.price * b.amount) >= 1) THEN '�Ϲݰ�'
				ELSE '���ɰ�'
		   END AS '�����'
	  FROM userTbl AS u
	  LEFT OUTER JOIN buyTbl AS b
		ON u.userID = b.userID
	 GROUP BY u.userID, u.name
	 --ORDER BY SUM(b.price * b.amount) DESC
)
 
SELECT [����ھ��̵�], [ȸ����]
     , FORMAT([�ѱ��űݾ�], '#,#') AS '�ѱ��űݾ�' -- '#,#' or 'C4'
	 , [�����]
  FROM cte_custlevel
 ORDER BY [�ѱ��űݾ�] DESC