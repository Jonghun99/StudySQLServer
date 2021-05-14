-- sqlDB�� ������ ���·� ctrl + N

-- <�ý��� �Լ�(SQL������ �⺻���� �������ִ� �Լ�)>
SELECT MIN(price) FROM buyTbl;
SELECT MAX(price) FROM buyTbl;
SELECT AVG(amount) FROM buyTbl; -- �Ҽ����� �ȳ��´�

-- �� ��ȯ (CAST(~ AS ~))
SELECT CAST(AVG(CAST(amount AS float)) AS decimal(5, 4)) FROM buyTbl;
SELECT AVG(CONVERT(FLOAT, amount)) FROM buyTbl;

SELECT PARSE('3.14' AS INT);     -- ���ܹ߻��ϸ� ������ ������ ����
SELECT TRY_PARSE('3.14' AS INT); -- �� ��ȯ�� ���ϸ� NULL�� ��ü�ϰ� ������ ����

-- height�� SMALLINT �̹Ƿ� VARCHAR�� CHAR(����)�� ����ȯ
SELECT name, CAST(height AS VARCHAR) + ' cm' FROM userTbl
 WHERE height IS NOT NULL; -- NULL���� IS( NOT)�� ��

SELECT PARSE('2021�� 5�� 14�� 10�� 27��' AS DATE);
SELECT PARSE('2021-05-14 10:28:10' AS DATETIME);

SELECT GETDATE(); -- INSERT ���� ����Ͻú��� ���� ���� ���

DECLARE @VAR INT;

-- <�ý��� ����(@@)>
SELECT @@SERVERNAME;
SELECT @@VERSION;

-- ��¥ �� �ð��Լ�
SELECT YEAR(GETDATE()) AS '����⵵'; 
SELECT MONTH(GETDATE()) AS '�����'; 
SELECT DAY(GETDATE()) AS '����'; 

-- ��ġ�Լ�
SELECT ABS(-100);
SELECT ROUND(3.141592, 2);
SELECT ROUND(RAND() * 100, 0); -- ROUND( ,0) = FLOOR() (����)

-- ���Լ�
SELECT IIF(100 > 200, '��','����'); -- *
