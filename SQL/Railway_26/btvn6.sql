USE testing_system_assignment_2; 
-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các
-- account thuộc phòng ban đó 
SELECT a.Account_ID,a.Fullname,d.Department_Name
FROM `account` a
JOIN  department d ON a.Department_ID = d.Department_ID 
WHERE d.Department_Name = 'HR'
  
  
  DELIMITER $$
DROP PROCEDURE IF EXISTS ND_ACC_DEP ;
CREATE PROCEDURE ND_ACC_DEP (IN in_Department_Name varchar(50))
BEGIN 
	SELECT a.Account_ID,a.Fullname,d.Department_Name
FROM `account` a
JOIN  department d ON a.Department_ID = d.Department_ID 
WHERE d.Department_Name = in_Department_Name ;
											
END $$
DELIMITER ;
CALL ND_ACC_DEP('HR');


-- Question 2: Tạo store để in ra số lượng account trong mỗi group 



 
-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
SELECT q.Type_id,COUNT(q.Question_id) AS SL_qe
FROM question q
GROUP BY q.Type_id; 

SELECT MAX(SL_qe) AS SL_MAX 
FROM ( 	SELECT COUNT(Question_id) AS SL_qe
		FROM  question 
		GROUP BY Type_id ) AB;  

SELECT q.Type_id, COUNT(q.Type_id)
FROM question q
GROUP BY q.Type_id
HAVING COUNT(q.Type_id) = (SELECT MAX(SL_qe) AS SL_MAX 
							FROM ( 	SELECT COUNT(Question_id) AS SL_qe
									FROM  question 
									GROUP BY Type_id ) AB);   
                                    
DELIMITER $$
DROP PROCEDURE IF EXISTS max_que ;
CREATE PROCEDURE max_que ()
BEGIN 
		SELECT q.Type_id, COUNT(q.Type_id)
		FROM question q
		GROUP BY q.Type_id
		HAVING COUNT(q.Type_id) = (SELECT MAX(SL_qe) AS SL_MAX 
									FROM ( 	SELECT COUNT(Question_id) AS SL_qe
											FROM  question 
											GROUP BY Type_id ) AB);   
END $$
DELIMITER ;
                            
                                    
                                    
                                    

