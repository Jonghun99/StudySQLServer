-- 1���� 100������ ���� �ݺ��ϸ鼭 7�� ����� ������ ������ �ջ�
-- ���� :
-- 1���� 100���� �� ����
-- 7��� ����(IF)

DECLARE @i INT, @hap BIGINT

SET @i = 0
SET @hap = 0

/*WHILE (@i <= 100)
BEGIN
	SET @hap = @hap + @i
	SET @i = @i + 1;
END

PRINT CONCAT('1~100 �� : ', @hap)*/

WHILE (@i <= 100)
BEGIN
	IF (@i % 7 =0)
	BEGIN
		PRINT CONCAT('7�� ��� : ', @i)
		SET @i = @i + 1
		CONTINUE
	END
	SET @hap = @hap + @i
	--IF (@hap > 1000) BREAK
	SET @i = @i + 1;
END

PRINT CONCAT('1~100 �� : ', @hap)