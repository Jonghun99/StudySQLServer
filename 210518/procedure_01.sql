-- ���� ���ν���
-- �Ķ����(�Ű�����) ���� ���ν���
CREATE PROC usp_users1
	@userName NVARCHAR(10)
AS
	-- ����
	SELECT userID, name, birthYear FROM userTbl
	 WHERE name = @userName;
GO

EXEC usp_users1 '���ð�'; 

SELECT * FROM v_userB