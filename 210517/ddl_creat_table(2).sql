USE sampleDB;
GO

CREATE TABLE userTBL
(
	userID CHAR(8) NOT NULL PRIMARY KEY, -- 기본키
	name NVARCHAR(10) NOT NULL,
	birthYear INT NOT NULL,
	height SMALLINT
);

CREATE TABLE buyTBL
(
	num INT NOT NULL PRIMARY KEY, -- 기본키
	userID CHAR(8) NOT NULL
		FOREIGN KEY REFERENCES userTBL(userID),  -- userTBL(부모)의 userID를 참조함(외래키)
	prodName NCHAR(4) NOT NULL,
	price INT NOT NULL
);
GO

-- 한개 이상의 PRIMARY KEY
CREATE TABLE prodTbl 
(
	prodCode NCHAR(3) NOT NULL,
	prodID NCHAR(3) NOT NULL,
	prodDate DATETIME NOT NULL,
	prodCur NCHAR(10) NULL
	CONSTRAINT PK_proTbl_prodCode_prodID PRIMARY KEY (prodCode, prodID)
);

-- userTBL에 email(유니크제약조건) 추가
ALTER TABLE userTBL
  ADD email VARCHAR(50) NULL UNIQUE

-- CHECK 제약조건 (C#의 property와 비슷)
ALTER TABLE userTBL
  ADD CONSTRAINT CK_birthYear
  CHECK (birthYear >= 1900 AND birthYear <= YEAR(GETDATE()))

-- 스키마
SELECT * FROM sampleDB.dbo.userTBL;

SELECT * FROM sqlDB.dbo.buyTBL;

SELECT * FROM AdventureWorksLT2019.SalesLT.Product;
SELECT * FROM AdventureWorksLT2019.dbo.ErrorLog;
