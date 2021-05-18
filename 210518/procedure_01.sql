-- 저장 프로시저
-- 파라미터(매개변수) 들어가는 프로시저
CREATE PROC usp_users1
	@userName NVARCHAR(10)
AS
	-- 로직
	SELECT userID, name, birthYear FROM userTbl
	 WHERE name = @userName;
GO

EXEC usp_users1 '성시경'; 

SELECT * FROM v_userB