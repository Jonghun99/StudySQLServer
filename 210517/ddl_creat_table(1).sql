-- 테이블생성
USE sampleDB;
GO

CREATE TABLE ddlTbl
(
	Id int NOT NULL PRIMARY KEY IDENTITY(1, 1), -- 초기값 1부터 1씩 증가
	name NVARCHAR(20) NOT NULL,
	regDate DATETIME
);
GO

-- DDL로 테이블 수정
ALTER TABLE ddlTbl ADD newColumn VARCHAR(10) NOT NULL; -- 새로운 요소 추가 

--ALTER TABLE ddlTbl ADD Id INT IDENTITY(1, 1);        -- 원래 있던 요소 수정은 DROP을 해줘야 함
--DROP TABLE ddlTbl;
