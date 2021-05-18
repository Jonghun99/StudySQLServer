USE sqlDB;
GO

-- 프로시저 생성(CREAT PROC, AS ~, GO ~)
CREATE PROC usp_users
AS
	SELECT userID, name, birthYear FROM userTbl;
GO

-- 실행
EXEC usp_users;

-- VIEW와의 비교(CREAT VIEW, AS ~, GO ~)
CREATE VIEW v_users 
AS
	SELECT userID, name, birthYear, addr FROM userTbl;
GO

SELECT * FROM v_users;

-- <프로시저를 쓰는 이유>
-- 1. 변수의 범위를 설정해서 실행해준다
-- 프로시저나 함수 코딩 때는 CREATE OR ALTER를 해주는 것이 편하다
CREATE OR ALTER PROC usp_users2
	@userBirthYear INT,
	@userHeight INT
AS
	SELECT userID, name, birthYear, height, mDate FROM userTbl
	 WHERE birthYear >= @userBirthYear
	   AND height >= @userHeight;
GO

EXEC usp_users2 195, 150;


-- 2. 리턴 받는 변수를 설정해 줄 수 있다
CREATE PROC usp_users3
	@lastName NVARCHAR(2),
	@outCount INT OUTPUT -- @outCount에 값을 리턴받음
AS
	SELECT COUNT(*) FROM userTbl WHERE name LIKE @lastName + '%';
GO

-- 원래 쓰는 것 : SELECT COUNT(*) FROM userTbl WHERE name LIKE '김' + '%';

DECLARE @myValue INT;
EXEC usp_users3 '김', @myValue OUTPUT;
PRINT CONCAT('김씨 성을 가진 사용자 수는', @myValue)