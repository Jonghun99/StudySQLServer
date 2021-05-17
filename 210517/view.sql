USE sampleDB;
GO

-- VEIW
-- 보안에 도움이 된다.(원본 테이블을 직접 고치지 않아도 됌)
-- 복잡한 쿼리를 단순화 시킨다.

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

SELECT * FROM v_userbuyInfo -- 단순하게 불러올 수 있다.
 ORDER BY price DESC; 

 DROP VIEW v_userTBl