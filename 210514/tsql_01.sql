-- ���α׷��� ����
USE sqlDB
GO

-- ���� ����
DECLARE @myVar1 INT;
DECLARE @myVar2 DECIMAL(5, 2); -- �� 5�ڸ�, ���� 3�ڸ� + �Ҽ��� 2�ڸ�
DECLARE @myVar3 NCHAR(20);
DECLARE @inchUnit DECIMAL(4, 3); -- ���� 1, �Ҽ��� 3

SET @myVar1 = 4000;
SET @myVar2 = 3.14;
SET @myVar3 = '���� �̸� ==> ';
SET @inchUnit = 0.393;

-- ������ Ȱ���Ͽ� ���� ����
-- SELECT @myVar1, @myVar2;
-- SELECT @myVar3 AS ' ', name FROM userTbl WHERE height > 180;
SELECT name, height * @inchUnit AS 'height_inch' FROM userTbl;