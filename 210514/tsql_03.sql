-- <���ڿ� �Լ�> ***

SELECT ASCII('z'), CHAR(66); -- ���� ��
SELECT UNICODE('��'), NCHAR(44032);

-- ���ڿ� ����
SELECT CONCAT('SQL', 'SERVER', 2019) AS [name]; -- ���� ��
SELECT 'SQL' + 'server' + CAST(2019 AS VARCHAR);

-- �ܾ��� ������ġ
SELECT CHARINDEX('world','Hello world'); -- ���α׷��� ���� 0����, �����ͺ��̽��� 1���� ���� *

-- LEFT, RIGHT, SUBSTRING, LEN, LOWER, UPPER, LTRIM, RTRIM : ���� ��
SELECT LEFT('SQL SERVER 2019', 3), RIGHT('SQL SERVER 2019',4);
DECLARE @STR VARCHAR(20);
SET @STR = 'SQL SERVER 2019';
SELECT LEFT(@STR, 3), RIGHT(@STR, 4);

SELECT SUBSTRING('���ѹα�����!', 5, 2)

SELECT LEN('Hello World');
SELECT LEN('���ѹα�����!');

SELECT LOWER('hELLO World');
SELECT UPPER('hello worlD 123');

SELECT LTRIM('    SQL'); -- ��
SELECT RTRIM('SQL    '); -- ��
SELECT TRIM('   SQL  '); -- ��

-- REPLACE : ���� �ֻ�
SELECT REPLACE('SQL SERVER 2019, SERVER', 'SERVER', '����');

-- STR : ���� ��. ��� CAST, PARSE, CONVERT
SELECT STR(3.141592);
SELECT STR(45);

-- FORMAT : ���� ��
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd hh:mm:ss'); -- �ѱ���
SELECT FORMAT(GETDATE(), 'dd/MM/yyyy hh:mm:ss'); -- �̱���
