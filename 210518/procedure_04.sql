-- ���� ���ν��� ����
CREATE OR ALTER PROC usp_zodiac
	@userName NVARCHAR(10)
AS
	DECLARE @bYear INT;
	DECLARE @zodiac NVARCHAR(3) -- ���̸� ����

	SELECT @bYear = birthYear FROM userTbl
	 WHERE name = @userName;

	SET @zodiac =
		CASE
			WHEN (@bYear%12 = 0) THEN '������'
			WHEN (@bYear%12 = 1) THEN '��'
			WHEN (@bYear%12 = 2) THEN '��'
			WHEN (@bYear%12 = 3) THEN '����'
			WHEN (@bYear%12 = 4) THEN '��'
			WHEN (@bYear%12 = 5) THEN '��'
			WHEN (@bYear%12 = 6) THEN 'ȣ����'
			WHEN (@bYear%12 = 7) THEN '�䳢'
			WHEN (@bYear%12 = 8) THEN '��'
			WHEN (@bYear%12 = 9) THEN '��'
			WHEN (@bYear%12 = 10) THEN '��'
			ELSE '��'
		END;
	PRINT CONCAT(@userName, '(', @bYear, '���)', '�� ', @zodiac, '�� �Դϴ�');
GO

EXEC usp_zodiac '���ð�';
EXEC usp_zodiac '�̽±�';
EXEC usp_zodiac '������';

-- �������ν��� ������� : 
-- 1. SQL Server�� �������
-- 2. ���� ���α׷��� ����
-- 3. ���� ��ȭ(��� ���. ���̺� ���ٱ����� ���� �ʰ�, ���� ���ν������� �����Ҽ� �ֵ��� ��)
-- 4. ��Ʈ��ũ ���۷��� ���ҽ�Ŵ
-- >>> �ϵ���� ������ ���� �����Ǿ� ������ ���� ������ �ʴ´�.


-- ????
DECLARE @var1 NVARCHAR
SET @var1 = 'KKH'
SELECT @var1 = userID FROM userTbl
IF @var1 = 'KKH'
BEGIN
	PRINT CONCAT('��� �⵵��', birthYear)
END 
ELSE 
BEGIN
	PRINT CONCAT('��� �⵵��', birthYear)
END