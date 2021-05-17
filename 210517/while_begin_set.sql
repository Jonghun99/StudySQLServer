-- 1부터 100까지의 수를 반복하면서 7의 배수를 제외한 나머지 합산
-- 순서 :
-- 1부터 100까지 합 먼저
-- 7배수 제외(IF)

DECLARE @i INT, @hap BIGINT

SET @i = 0
SET @hap = 0

/*WHILE (@i <= 100)
BEGIN
	SET @hap = @hap + @i
	SET @i = @i + 1;
END

PRINT CONCAT('1~100 합 : ', @hap)*/

WHILE (@i <= 100)
BEGIN
	IF (@i % 7 =0)
	BEGIN
		PRINT CONCAT('7의 배수 : ', @i)
		SET @i = @i + 1
		CONTINUE
	END
	SET @hap = @hap + @i
	--IF (@hap > 1000) BREAK
	SET @i = @i + 1;
END

PRINT CONCAT('1~100 합 : ', @hap)