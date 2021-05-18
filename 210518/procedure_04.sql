-- 저장 프로시저 예제
CREATE OR ALTER PROC usp_zodiac
	@userName NVARCHAR(10)
AS
	DECLARE @bYear INT;
	DECLARE @zodiac NVARCHAR(3) -- 띠이름 변수

	SELECT @bYear = birthYear FROM userTbl
	 WHERE name = @userName;

	SET @zodiac =
		CASE
			WHEN (@bYear%12 = 0) THEN '원숭이'
			WHEN (@bYear%12 = 1) THEN '닭'
			WHEN (@bYear%12 = 2) THEN '개'
			WHEN (@bYear%12 = 3) THEN '돼지'
			WHEN (@bYear%12 = 4) THEN '쥐'
			WHEN (@bYear%12 = 5) THEN '소'
			WHEN (@bYear%12 = 6) THEN '호랑이'
			WHEN (@bYear%12 = 7) THEN '토끼'
			WHEN (@bYear%12 = 8) THEN '용'
			WHEN (@bYear%12 = 9) THEN '뱀'
			WHEN (@bYear%12 = 10) THEN '말'
			ELSE '양'
		END;
	PRINT CONCAT(@userName, '(', @bYear, '년생)', '은 ', @zodiac, '띠 입니다');
GO

EXEC usp_zodiac '성시경';
EXEC usp_zodiac '이승기';
EXEC usp_zodiac '주지훈';

-- 저장프로시저 사용이유 : 
-- 1. SQL Server의 성능향상
-- 2. 모듈식 프로그래밍 가능
-- 3. 보안 강화(뷰와 비슷. 테이블에 접근권한을 주지 않고, 저장 프로시저에만 접근할수 있도록 함)
-- 4. 네트워크 전송량을 감소시킴
-- >>> 하드웨어 성능이 많이 발전되어 요즘은 많이 쓰이진 않는다.


-- ????
DECLARE @var1 NVARCHAR
SET @var1 = 'KKH'
SELECT @var1 = userID FROM userTbl
IF @var1 = 'KKH'
BEGIN
	PRINT CONCAT('출생 년도는', birthYear)
END 
ELSE 
BEGIN
	PRINT CONCAT('출생 년도는', birthYear)
END