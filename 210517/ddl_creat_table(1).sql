-- ���̺�����
USE sampleDB;
GO

CREATE TABLE ddlTbl
(
	Id int NOT NULL PRIMARY KEY IDENTITY(1, 1), -- �ʱⰪ 1���� 1�� ����
	name NVARCHAR(20) NOT NULL,
	regDate DATETIME
);
GO

-- DDL�� ���̺� ����
ALTER TABLE ddlTbl ADD newColumn VARCHAR(10) NOT NULL; -- ���ο� ��� �߰� 

--ALTER TABLE ddlTbl ADD Id INT IDENTITY(1, 1);        -- ���� �ִ� ��� ������ DROP�� ����� ��
--DROP TABLE ddlTbl;