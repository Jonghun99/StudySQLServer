-- GROUP BY
-- 아이디별로 물건 몇개 샀는지 조회 
SELECT userID, SUM(amount) AS '총구매갯수'
  FROM buyTbl
 GROUP BY userID;

-- 우리 쇼핑몰에서 가장 돈많이 쓴 사람을
-- 아이디별로 조회하고 그 금액을 같이 출력하라

SELECT userID, SUM(amount * price) AS '총구매금액'
  FROM buyTbl
 GROUP BY userID
 ORDER BY SUM(amount * price) DESC;

-- 직계함수는 GROUP BY 없이 쓸수 있지만, 
-- GROUP BY는 직계함수 없이 쓸수 없다
SELECT SUM(amount * price) AS '총구매금액'
  FROM buyTbl

SELECT AVG(price) AS [평균구매금액] 
  FROM buyTbl;

SELECT * FROM userTbl
 ORDER BY height DESC;

-- 사용자 테이블에서 키가 가장 큰사람과 가장 작은사람 조회
SELECT * FROM userTbl
 WHERE height = 166 OR height = 186; /* X!! */

SELECT name AS '이름', height AS '키' FROM userTbl
 WHERE height = (SELECT MAX(height) FROM userTbl)
    OR height = (SELECT MIN(height) FROM userTbl) /* OK */

-- GROUP BY와 같이 쓰는 HAVING
SELECT userID AS '사용자아이디'
     , SUM(price * amount) AS [총구매금액]
  FROM buyTbl
-- WHERE SUM(price * amount) >= 1000 // 절대불가 GROUP BY 뒤에 써야함(HAVING)
 GROUP BY userID
HAVING SUM(Price * amount) >= 1000

-- 통계
-- 제품 그룹별로 사용자가 얼마만큼 구매를 했는지 조회
SELECT groupName
     , userID
     , SUM(price * amount) AS [총구매금액]
  FROM buyTbl
 GROUP BY userID, groupName;

-- 그룹별로 중간합을 나타내고, 마지막에 총합계
SELECT groupName
     , userID
     , SUM(price * amount) AS [총구매금액]
  FROM buyTbl
 GROUP BY ROLLUP(groupName, userID);

-- ID별로 중간합을 나타내고, 마지막에 총합계
SELECT groupName
     , userID
     , SUM(price * amount) AS [총구매금액]
  FROM buyTbl
 GROUP BY ROLLUP(userID, groupName);

-- CUBE는 ROLLUP과는 반대로 동작하고, 마지막에 그룹별 총합계
SELECT groupName
     , userID
     , SUM(price * amount) AS [총구매금액]
	 , GROUPING_ID(groupName) AS 'SUM1'
	 , GROUPING_ID(userID) AS 'SUM2'
  FROM buyTbl
 GROUP BY CUBE(userID, groupName);

SELECT groupName
     , SUM(price * amount) AS [총구매금액]
	 , GROUPING_ID(groupName) AS 'SUM'
  FROM buyTbl
 GROUP BY CUBE(groupName);