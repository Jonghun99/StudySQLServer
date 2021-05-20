-- 1��
SELECT LOWER(Email) AS 'email'
     , Mobile AS 'mobile'
	 , Names AS 'names'
	 , Addr AS 'addr'
  FROM membertbl
 ORDER BY Names DESC;

-- 2��
SELECT Names AS 'names'
     , Author AS 'author'
	 , ReleaseDate AS 'releaseDate'
	 , Price AS 'price'
  FROM bookstbl;

-- 3��
SELECT Idx
		, CONCAT('���� : ', Names) AS 'Names'
		, CONCAT('���� > ', Author) AS 'Author'
		, FORMAT(ReleaseDate, 'yyyy�� MM�� dd��') AS '������'
		, ISBN
		, CONCAT(FORMAT(price, '#,#'), '��') AS '����'
  FROM bookstbl
 ORDER BY Idx DESC;

-- 4��
SELECT m.Names
     , m.Levels
	 , m.Addr
	 , r.rentalDate
  FROM membertbl AS m
  LEFT OUTER JOIN rentaltbl AS r
    ON m.Idx = r.memberIdx
 WHERE rentalDate IS NULL;

-- 5��
SELECT d.Names AS 'names'
     , FORMAT(SUM(b.Price), '#,#��') AS '���հ�ݾ�'
  FROM divtbl AS d
 INNER JOIN bookstbl AS b
    ON d.Division = b.Division
 GROUP BY ROLLUP(d.Names);