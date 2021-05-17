-- null이 많은 collumn에는 index를 넣지 않음
USE sampleDB;
GO

CREATE SCHEMA production; -- 스키마 생성
GO

CREATE TABLE production.parts ( 
	part_id INT NOT NULL,
	part_name VARCHAR(100)
);
GO

SELECT * FROM production.parts
