-- sqlDB가 눌러진 상태로 ctrl + N

-- <시스템 함수(SQL서버가 기본으로 제공해주는 함수)>
SELECT MIN(price) FROM buyTbl;
SELECT MAX(price) FROM buyTbl;
SELECT AVG(amount) FROM buyTbl; -- 소숫점이 안나온다

-- 형 변환 (CAST(~ AS ~))
SELECT CAST(AVG(CAST(amount AS float)) AS decimal(5, 4)) FROM buyTbl;
SELECT AVG(CONVERT(FLOAT, amount)) FROM buyTbl;

SELECT PARSE('3.14' AS INT);     -- 예외발생하면 쿼리가 비정상 종료
SELECT TRY_PARSE('3.14' AS INT); -- 값 변환을 못하면 NULL로 대체하고 정상적 수행

-- height는 SMALLINT 이므로 VARCHAR나 CHAR(고정)로 형변환
SELECT name, CAST(height AS VARCHAR) + ' cm' FROM userTbl
 WHERE height IS NOT NULL; -- NULL값은 IS( NOT)로 비교

SELECT PARSE('2021년 5월 14일 10시 27분' AS DATE);
SELECT PARSE('2021-05-14 10:28:10' AS DATETIME);

SELECT GETDATE(); -- INSERT 현재 년월일시분초 제일 많이 사용

DECLARE @VAR INT;

-- <시스템 변수(@@)>
SELECT @@SERVERNAME;
SELECT @@VERSION;

-- 날짜 및 시간함수
SELECT YEAR(GETDATE()) AS '현재년도'; 
SELECT MONTH(GETDATE()) AS '현재월'; 
SELECT DAY(GETDATE()) AS '오늘'; 

-- 수치함수
SELECT ABS(-100);
SELECT ROUND(3.141592, 2);
SELECT ROUND(RAND() * 100, 0); -- ROUND( ,0) = FLOOR() (내림)

-- 논리함수
SELECT IIF(100 > 200, '참','거짓'); -- *
