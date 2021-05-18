-- 3. 
/*public void usp_isyoung(string userName)
{
	var bYear;
}*/
CREATE OR ALTER PROC usp_isyoung
	@userName NVARCHAR(10)
AS
	DECLARE @bYear INT 

	SELECT @bYear = birthYear FROM userTbl --*
	 WHERE name = @userName;

	IF (@bYear >= 1980)
	BEGIN
		PRINT '아직 젊습니다';
	END
	ELSE
	BEGIN
		PRINT '늙으셨네요';
	END
GO

EXEC usp_isyoung '성시경';
EXEC usp_isyoung '이승기';