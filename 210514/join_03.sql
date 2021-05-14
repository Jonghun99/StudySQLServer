-- 내부조인
SELECT u.userID, u.name, b.prodName
     , u.addr, CONCAT(u.mobile1, u.mobile2) AS mobile
  FROM userTbl AS u
 INNER JOIN buyTbl AS b
    ON u.userID = b.userID
 ORDER BY u.userID;

-- 외부조인
-- 쇼핑몰에서 물건을 한번도 구매하지 않은 회원들을 조회
SELECT u.userID, u.name
     , u.addr, CONCAT(u.mobile1, u.mobile2) AS mobile
	 , b.prodName
  FROM userTbl AS u
  LEFT OUTER JOIN buyTbl AS b
    ON u.userID = b.userID
 WHERE b.prodName IS NULL
 ORDER BY u.userID;

 SELECT u.userID, u.name
     , u.addr, CONCAT(u.mobile1, u.mobile2) AS mobile
	 , b.prodName
  FROM userTbl AS u
 RIGHT OUTER JOIN buyTbl AS b
    ON u.userID = b.userID
 WHERE b.prodName IS NULL
 ORDER BY u.userID;

-- 학생 / 동아리 / 가입정보 테이블
-- INNERJOIN
SELECT s.StdID, s.StdName, s.Region
     , r.ClubName, c.ClubRoom
	 , r.RegDate
  FROM stdTbl AS s
 INNER JOIN reginfoTbl AS r
    ON s.StdID = r.StdID
 INNER JOIN clubTbl AS c
    ON c.ClubName = r.ClubName
 
-- OUTERJOIN
SELECT s.StdID, s.StdName, s.Region
     , r.ClubName, c.ClubRoom
	 , r.RegDate
  FROM stdTbl AS s
  LEFT OUTER JOIN reginfoTbl AS r -- std를 기준으로 club에 가입하지 않은 김경호, 임재범도 조회한다.
    ON s.StdID = r.StdID
  --LEFT OUTER JOIN clubTbl AS c  -- reg를 기준으로 하므로 아무도 가입하지 않은 봉사, 수영 동아리는 나오지 않는다.
  --  ON c.ClubName = r.ClubName
 RIGHT OUTER JOIN clubTbl AS c    -- club를 기준으로 하므로 아무도 가입하지 않은 봉사, 수영 동아리의 Room은 나온다. 단, club이 후에 기준이 되었으므로, 가입하지 않은 김경호, 임재범은 안나온다. 
    ON c.ClubName = r.ClubName

SELECT c.ClubName, c.ClubRoom, r.Id, r.RegDate, s.StdName
  FROM clubTbl AS c
  LEFT OUTER JOIN reginfoTbl AS r -- 기준 : clubTbl(club은 전부 나온다. 아무도 가입하지 않은 봉사, 수영도 나옴)
    ON r.ClubName = c.ClubName    -- 이 순서는 상관 없음
 RIGHT OUTER JOIN stdTbl as s     -- 기준 : stdTbl(stu은 전부 나온다. 아무 club에도 가입하지 않은 김경호, 임재범도 나온다. 단, std가 후에 기준이 되었으므로, 봉사, 수영동아리는 안나온다.)
    ON r.StdID = s.StdID
  