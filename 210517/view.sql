USE sampleDB;
GO

-- VEIW
-- ���ȿ� ������ �ȴ�.(���� ���̺��� ���� ��ġ�� �ʾƵ� ��)
-- ������ ������ �ܼ�ȭ ��Ų��.

CREATE VIEW v_userTBl
AS
	SELECT userID, name, addr FROM userTBL;
GO

SELECT userID, name, addr FROM v_userTBL;

SELECT * FROM v_buyTBL;


CREATE VIEW v_userbuyInfo
AS
	SELECT u.userID, u.name, b.prodName, b.price
	  FROM userTbl AS u
	 INNER JOIN buyTbl b              
	    ON u.userID = b.userID;
GO

SELECT * FROM v_userbuyInfo -- �ܼ��ϰ� �ҷ��� �� �ִ�.
 ORDER BY price DESC; 

 DROP VIEW v_userTBl