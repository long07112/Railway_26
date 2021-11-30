USE testing_system_assignment_2 ;






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

       
       