USE sampleDB;
GO

CREATE TABLE userTBL
(
	userID CHAR(8) NOT NULL PRIMARY KEY, -- �⺻Ű
	name NVARCHAR(10) NOT NULL,
	birthYear INT NOT NULL,
	height SMALLINT
);

CREATE TABLE buyTBL
(
	num INT NOT NULL PRIMARY KEY, -- �⺻Ű
	userID CHAR(8) NOT NULL
		FOREIGN KEY REFERENCES userTBL(userID),  -- userTBL(�θ�)�� userID�� ������(�ܷ�Ű)
	prodName NCHAR(4) NOT NULL,
	price INT NOT NULL
);
GO

-- �Ѱ� �̻��� PRIMARY KEY
CREATE TABLE prodTbl 
(
	prodCode NCHAR(3) NOT NULL,
	prodID NCHAR(3) NOT NULL,
	prodDate DATETIME NOT NULL,
	prodCur NCHAR(10) NULL
	CONSTRAINT PK_proTbl_prodCode_prodID PRIMARY KEY (prodCode, prodID)
);

-- userTBL�� email(����ũ��������) �߰�
ALTER TABLE userTBL
  ADD email VARCHAR(50) NULL UNIQUE

-- CHECK �������� (C#�� property�� ���)
ALTER TABLE userTBL
  ADD CONSTRAINT CK_birthYear
  CHECK (birthYear >= 1900 AND birthYear <= YEAR(GETDATE()))

-- ��Ű��
SELECT * FROM sampleDB.dbo.userTBL;

SELECT * FROM sqlDB.dbo.buyTBL;

SELECT * FROM AdventureWorksLT2019.SalesLT.Product;
SELECT * FROM AdventureWorksLT2019.dbo.ErrorLog;
