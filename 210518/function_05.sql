-- 입력한 출생년도 이후에 사용자 중에서 구매등급에 따른 결과를 반환하라

CREATE OR ALTER FUNCTION ufn_userGrade(@bYear INT)
	RETURNS @retTable TABLE
	(
		userID CHAR(8), 
		name NCHAR(10), 
		grade NVARCHAR(5)
	)
AS
BEGIN
	DECLARE @rowCnt INT;
	SELECT @rowCnt = COUNT(*) FROM userTbl WHERE birthYear >= @bYear;

	IF @rowCnt <= 0
	BEGIN
		INSERT INTO @retTable VALUES('없음', '없음', '없음')
		RETURN;
	END
	ELSE
	BEGIN
		-- 입력구문
		INSERT INTO @retTable
		SELECT u.userID, u.name, 
		       CASE 
			   WHEN SUM(b.price * b.amount) >= 1500 THEN '최우수'
		       WHEN SUM(b.price * b.amount) >= 1000 THEN '최우수'
		       WHEN SUM(b.price * b.amount) >= 1 THEN '일반'
			   ELSE '유령'
			   END
		  FROM userTbl AS u
	      LEFT OUTER JOIN buyTbl AS b
		    ON u.userID = b.userID
		 WHERE u.birthYear >= @bYear
		 GROUP BY u.userID, u.name
		RETURN ;
	END
	RETURN;
END
GO

-- 함수 호출 방법
SELECT * FROM dbo.ufn_userGrade(2000);
SELECT * FROM dbo.ufn_userGrade(1970);

-- 저장프로시저
EXEC usp_users1 '성시경';