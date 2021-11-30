USE testing_system_assignment_2 ;
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ-- 
SELECT B.Account_ID ,B.Username,B.Fullname,C.Department_Name
FROM `account` B
JOIN Department C ON B.Department_ID= C.Department_ID ;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 2021/11/14
SELECT A.Email,A.Username,A.Fullname,A.CreateDate
FROM `account` A
WHERE CreateDate >20211114 ;

-- Question 3: Viết lệnh để lấy ra tất cả các developer 
SELECT C.Position_ID,C.Position_Name,D.Username,D.Fullname
FROM Position C  
JOIN `account` D ON C.Position_ID = D.Position_ID
WHERE C.Position_name = 'GIAM DOC' ;

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT Account_ID,COUNT(Department_ID) AS SỐ_NHÂN_VIÊN
FROM `account`
GROUP BY Department_ID ; 

SELECT D.Department_ID,D.Department_name,COUNT(*) AS SỐ_NHÂN_VIÊN
FROM `account` AC
JOIN Department D ON AC.Department_ID = D.Department_ID
GROUP BY AC.Department_ID 
HAVING COUNT(AC.Department_ID) > 3;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT Question_id, COUNT(Question_id ) AS SL_AN
FROM answer  
GROUP BY Question_id; 

DROP VIEW IF EXISTS MAX_ANSWER;

CREATE VIEW MAX_ANSWER AS 
SELECT MAX(SL_AN) AS SL_MAX 
FROM ( 	SELECT  COUNT(Question_id) AS SL_AN
		FROM answer 
		GROUP BY Question_id ) AB;  

SELECT AN.Question_id, Q.Content,COUNT(AN.Question_ID)
FROM answer AN 
JOIN Question Q ON AN.Question_ID = Q.Question_ID 
GROUP BY Q.Question_id
HAVING COUNT(AN.Question_ID) = (SELECT MAX(SL_AN) AS SL_MAX 
FROM ( 	SELECT  COUNT(Question_id) AS SL_AN
		FROM answer 
		GROUP BY Question_id ) AB); 

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều
-- nhất
SELECT Exam_id , COUNT(Question_id ) AS SL_AN
FROM examquestion
GROUP BY Question_id ;

SELECT MAX(SL_AN) AS SL_MAX 
FROM ( 	SELECT  COUNT(Question_id) AS SL_AN
		FROM examquestion 
		GROUP BY Question_id ) AB; 
 

 
	SELECT q.Content, COUNT(eq.Question_id)
	FROM Question q 
	JOIN examquestion eq  on eq.Question_id = q.Question_id
    group by eq.Question_id
	HAVING  COUNT(eq.Question_id) = (SELECT MAX(SL_MAX) from (SELECT COUNT(Question_id) AS SL_MAX 
																FROM examquestion  
																	GROUP BY Question_id)  AB );

      --  Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
       
       SELECT B.Category_id,COUNT(B.Category_id)
       FROM question B 
       GROUP BY Category_id;
       
      --  Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam 
	SELECT e.Exam_id,COUNT(e.Exam_id)
    FROM exam e
    GROUP BY Exam_id; 
    
    -- Question 9: Thống kê số lượng account trong mỗi group 
    
       SELECT g.Group_id, COUNT(Account_id)
       FROM groupacount g
       GROUP BY Account_id ;
       
       
       
      --  Question 10: Tìm chức vụ có ít người nhất
       
       
       