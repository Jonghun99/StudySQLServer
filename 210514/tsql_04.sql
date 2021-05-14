-- 순위함수(RANK() OVER())

SELECT name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL
 ORDER BY height DESC;

SELECT ROW_NUMBER() OVER(ORDER BY height DESC) AS '키순위' -- 동점자 처리못함
     , name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL;

SELECT RANK() OVER(ORDER BY height DESC) AS '키순위'       -- 동점자 처리가능
     , name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL;

SELECT DENSE_RANK() OVER(ORDER BY height DESC) AS '키순위' -- 동점자를 1명으로
     , name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL;

SELECT DENSE_RANK() OVER(PARTITION BY addr ORDER BY height DESC) AS '키순위' -- 지역별로 구분
     , name, height, addr 
  FROM userTbl
 WHERE height IS NOT NULL;

 -- 순위함수 적용 순서

 SELECT userID, SUM(price * amount) AS '사용자별구매금액'
  FROM buyTbl
 GROUP BY userID
 ORDER BY SUM(price * amount)

 SELECT RANK() OVER(ORDER BY SUM(price * amount) DESC) AS '구매순위'
      , userID, SUM(price * amount) AS '사용자별구매금액'
   FROM buyTbl
  GROUP BY userID