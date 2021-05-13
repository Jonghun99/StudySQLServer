-- GROUP BY ROLLUP
WITH cte_summary(GRP, SUMM, DIV) -- 가상의 테이블
AS
(
	SELECT groupName AS GRP
		 , SUM(price * amount) AS SUMM
		 , GROUPING_ID(groupName) AS DIV --영어는 따옴표 없어도 됨
	  FROM buyTbl
	 GROUP BY ROLLUP(groupName)
)

SELECT 
       CASE div
	   WHEN 0 THEN grp 
	   WHEN 1 THEN '총합계' END AS [상품그룹] 
     , summ AS [그룹별구매금액]
	 --, div 
  FROM cte_summary;