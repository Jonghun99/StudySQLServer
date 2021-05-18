CREATE OR ALTER FUNCTION ufn_getInch(@height INT)
	returns INT
AS
BEGIN
	DECLARE @val INT
	SET @val = @height * 0.393;
	RETURN(@val)
END
GO

SELECT userID, name
     , birthYear, dbo.ufn_getAge(birthYear) AS '나이'
	 , addr
	 , height , dbo.ufn_getInch(height) AS '키(인치)'
  FROM userTbl;
