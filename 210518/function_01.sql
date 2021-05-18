CREATE OR ALTER FUNCTION ufn_getAge(@bYear INT)
	RETURNS INT
AS
BEGIN
	DECLARE @age INT
	SET @age = YEAR(GETDATE()) - @bYear + 1 -- 한국식 나이
	RETURN(@age)
END
GO

SELECT userID, name
     , birthYear, dbo.ufn_getAge(birthYear) AS 'age' -- 함수 결과는 무조건 열이름 없음
	 , addr, height
  FROM userTbl;
