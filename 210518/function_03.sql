CREATE OR ALTER FUNCTION ufn_getZodiac(@bYear INT)
	RETURNS NVARCHAR(3)
AS
BEGIN
	DECLARE @result NVARCHAR(3)

	SET @result =
		CASE
			WHEN (@bYear%12 = 0) THEN '¿ø¼þÀÌ'
			WHEN (@bYear%12 = 1) THEN '´ß'
			WHEN (@bYear%12 = 2) THEN '°³'
			WHEN (@bYear%12 = 3) THEN 'µÅÁö'
			WHEN (@bYear%12 = 4) THEN 'Áã'
			WHEN (@bYear%12 = 5) THEN '¼Ò'
			WHEN (@bYear%12 = 6) THEN 'È£¶ûÀÌ'
			WHEN (@bYear%12 = 7) THEN 'Åä³¢'
			WHEN (@bYear%12 = 8) THEN '¿ë'
			WHEN (@bYear%12 = 9) THEN '¹ì'
			WHEN (@bYear%12 = 10) THEN '¸»'
			ELSE '¾ç'
		END;
	RETURN @result
END
GO

SELECT userID, name
     , birthYear, dbo.ufn_getAge(birthYear) AS '³ªÀÌ'
	 , dbo.ufn_getZodiac(birthYear) AS '¶ì'
	 , addr 
	 , height , dbo.ufn_getInch(height) AS 'Å°(ÀÎÄ¡)'
  FROM userTbl;