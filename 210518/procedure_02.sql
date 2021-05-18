USE sqlDB;
GO

-- ���ν��� ����(CREAT PROC, AS ~, GO ~)
CREATE PROC usp_users
AS
	SELECT userID, name, birthYear FROM userTbl;
GO

-- ����
EXEC usp_users;

-- VIEW���� ��(CREAT VIEW, AS ~, GO ~)
CREATE VIEW v_users 
AS
	SELECT userID, name, birthYear, addr FROM userTbl;
GO

SELECT * FROM v_users;

-- <���ν����� ���� ����>
-- 1. ������ ������ �����ؼ� �������ش�
-- ���ν����� �Լ� �ڵ� ���� CREATE OR ALTER�� ���ִ� ���� ���ϴ�
CREATE OR ALTER PROC usp_users2
	@userBirthYear INT,
	@userHeight INT
AS
	SELECT userID, name, birthYear, height, mDate FROM userTbl
	 WHERE birthYear >= @userBirthYear
	   AND height >= @userHeight;
GO

EXEC usp_users2 195, 150;


-- 2. ���� �޴� ������ ������ �� �� �ִ�
CREATE PROC usp_users3
	@lastName NVARCHAR(2),
	@outCount INT OUTPUT -- @outCount�� ���� ���Ϲ���
AS
	SELECT COUNT(*) FROM userTbl WHERE name LIKE @lastName + '%';
GO

-- ���� ���� �� : SELECT COUNT(*) FROM userTbl WHERE name LIKE '��' + '%';

DECLARE @myValue INT;
EXEC usp_users3 '��', @myValue OUTPUT;
PRINT CONCAT('�达 ���� ���� ����� ����', @myValue)