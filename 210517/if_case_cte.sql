-- 구매한 금액에 따라서 최우수/우수/일반고객으로 분류하는 쿼리를 작성하라
-- 순서 : 
-- userID, name 나타내기(select from where)
-- inner join 시키기
-- sum, group by(집계함수를 제외한 일반 COLLUMS은 꼭 들어가야함)
-- left outer join으로 userID 전부 표시

-- ORDER BY
-- IIF로 NULL대신 0
-- CASE WHEN THEN 으로 등급매기기

-- CTE로 가상의테이블 만들어서 총구매금액 원화표시하기

WITH cte_custlevel([사용자아이디], [회원명], [총구매금액], [고객등급])
AS
(
	SELECT u.userID AS '사용자아이디'
		 , u.name AS '회원명'
		 , IIF(SUM(b.price * b.amount) IS NULL
			   , 0
			   , SUM(b.price * b.amount)) AS '총구매금액' 
		 , CASE 
				WHEN (SUM(b.price * b.amount) >= 1500) THEN '최우수고객'
				WHEN (SUM(b.price * b.amount) >= 1000) THEN '우수고객'
				WHEN (SUM(b.price * b.amount) >= 1) THEN '일반고객'
				ELSE '유령고객'
		   END AS '고객등급'
	  FROM userTbl AS u
	  LEFT OUTER JOIN buyTbl AS b
		ON u.userID = b.userID
	 GROUP BY u.userID, u.name
	 --ORDER BY SUM(b.price * b.amount) DESC
)
 
SELECT [사용자아이디], [회원명]
     , FORMAT([총구매금액], '#,#') AS '총구매금액' -- '#,#' or 'C4'
	 , [고객등급]
  FROM cte_custlevel
 ORDER BY [총구매금액] DESC