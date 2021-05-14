-- <문자열 함수> ***

SELECT ASCII('z'), CHAR(66); -- 사용빈도 하
SELECT UNICODE('가'), NCHAR(44032);

-- 문자열 연결
SELECT CONCAT('SQL', 'SERVER', 2019) AS [name]; -- 사용빈도 상
SELECT 'SQL' + 'server' + CAST(2019 AS VARCHAR);

-- 단어의 시작위치
SELECT CHARINDEX('world','Hello world'); -- 프로그래밍 언어는 0부터, 데이터베이스는 1부터 시작 *

-- LEFT, RIGHT, SUBSTRING, LEN, LOWER, UPPER, LTRIM, RTRIM : 사용빈도 상
SELECT LEFT('SQL SERVER 2019', 3), RIGHT('SQL SERVER 2019',4);
DECLARE @STR VARCHAR(20);
SET @STR = 'SQL SERVER 2019';
SELECT LEFT(@STR, 3), RIGHT(@STR, 4);

SELECT SUBSTRING('대한민국만세!', 5, 2)

SELECT LEN('Hello World');
SELECT LEN('대한민국만세!');

SELECT LOWER('hELLO World');
SELECT UPPER('hello worlD 123');

SELECT LTRIM('    SQL'); -- 중
SELECT RTRIM('SQL    '); -- 중
SELECT TRIM('   SQL  '); -- 상

-- REPLACE : 사용빈도 최상
SELECT REPLACE('SQL SERVER 2019, SERVER', 'SERVER', '서버');

-- STR : 사용빈도 하. 대신 CAST, PARSE, CONVERT
SELECT STR(3.141592);
SELECT STR(45);

-- FORMAT : 사용빈도 상
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd hh:mm:ss'); -- 한국식
SELECT FORMAT(GETDATE(), 'dd/MM/yyyy hh:mm:ss'); -- 미국식
