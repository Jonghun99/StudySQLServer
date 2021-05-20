-- 1번
SELECT LOWER(Email) AS 'email'
     , Mobile AS 'mobile'
	 , Names AS 'names'
	 , Addr AS 'addr'
  FROM membertbl
 ORDER BY Names DESC;

-- 2번
SELECT Names AS 'names'
     , Author AS 'author'
	 , ReleaseDate AS 'releaseDate'
	 , Price AS 'price'
  FROM bookstbl;

-- 3번
SELECT Idx
		, CONCAT('제목 : ', Names) AS 'Names'
		, CONCAT('저자 > ', Author) AS 'Author'
		, FORMAT(ReleaseDate, 'yyyy년 MM월 dd일') AS '출판일'
		, ISBN
		, CONCAT(FORMAT(price, '#,#'), '원') AS '가격'
  FROM bookstbl
 ORDER BY Idx DESC;

-- 4번
SELECT m.Names
     , m.Levels
	 , m.Addr
	 , r.rentalDate
  FROM membertbl AS m
  LEFT OUTER JOIN rentaltbl AS r
    ON m.Idx = r.memberIdx
 WHERE rentalDate IS NULL;

-- 5번
SELECT d.Names AS 'names'
     , FORMAT(SUM(b.Price), '#,#원') AS '총합계금액'
  FROM divtbl AS d
 INNER JOIN bookstbl AS b
    ON d.Division = b.Division
 GROUP BY ROLLUP(d.Names);