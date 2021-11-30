--  Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale-- 
    
    USE testing_system_assignment_2 ; 
	DROP VIEW IF EXISTS  PB_SALE  ; 
	CREATE VIEW PB_SALE AS
	SELECT S.Account_id
	FROM `Account` S
	JOIN Department A ON A.Department_id =  S.Department_id
    WHERE Department_name = 'sale'; 
    
   --  Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất 
   CREATE VIEW TT_AC AS
   SELECT D.Group_id ,A.Email,A.Username,A.Fullname,G.GroupName, COUNT(D.Group_id) AS C
   FROM groupacount D 
   JOIN `account` A ON D.Account_ID = A.Account_ID 
   JOIN `group` G ON G.Group_id = D.Group_id
   GROUP BY D.Account_id 
   HAVING COUNT(D.Account_id) = 	(SELECT MAX(C)
								FROM( 	SELECT D.Group_id , COUNT(D.Account_id ) AS C
										FROM groupacount D
										GROUP BY D.Account_id ) AB) ;
                     
                     
                     
                     
   -- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ                                          
-- được coi là quá dài) và xóa nó đi 

CREATE VIEW lenght_conten AS 
SELECT 	Question_id, content ,LENGTH(content)
FROM 	Question
-- ORDER BY LENGTH(content) DESC ;
WHERE LENGTH(content) =  ( SELECT MAX(LENGTH(content)) FROM Question );  
	 																			
-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất

CREATE VIEW MAX_NV AS 
SELECT  Account_ID,COUNT(Department_ID) AS SỐ_NHÂN_VIÊN
FROM `account` 
GROUP BY Department_ID ; 


                                                       