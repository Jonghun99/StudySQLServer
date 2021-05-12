--조회명령문
SELECT memberID, memberName 
  FROM memberTBL
 Where memberID = 'Sang';

--SELECT productName, cost, company FROM productTBL;

--입력명령문
INSERT INTO memberTBL
Values ('Bang', '방문식', '부산시 진구');
