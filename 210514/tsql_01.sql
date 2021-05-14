-- 프로그래밍 시작
USE sqlDB
GO

-- 변수 선언
DECLARE @myVar1 INT;
DECLARE @myVar2 DECIMAL(5, 2); -- 총 5자리, 정수 3자리 + 소숫점 2자리
DECLARE @myVar3 NCHAR(20);
DECLARE @inchUnit DECIMAL(4, 3); -- 정수 1, 소숫점 3

SET @myVar1 = 4000;
SET @myVar2 = 3.14;
SET @myVar3 = '가수 이름 ==> ';
SET @inchUnit = 0.393;

-- 변수를 활용하여 값을 정리
-- SELECT @myVar1, @myVar2;
-- SELECT @myVar3 AS ' ', name FROM userTbl WHERE height > 180;
SELECT name, height * @inchUnit AS 'height_inch' FROM userTbl;