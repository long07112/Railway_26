USE Testing_System_Assignment_2;
SELECT * FROM department;

SELECT * FROM department
where department_name = 'SALE'; 

SELECT * FROM `Account` 
WHERE department_id = 3 AND LENGTH (Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`) ;

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id
-- = 3
SELECT * FROM `Account` 
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`);   

-- Question 6:		-- ---Lấy ra tên group đã tham gia trước ngày 20/12/2019
        
SELECT Group_id,GroupName  FROM  `Group`  WHERE CreateDate >= "20201108";

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày
-- 20/12/2019
-- Question 9: Lấy ra 5 group được tạo gần đây nhất
-- Question 10: Đếm số nhân viên thuộc department có id = 2
-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và
-- email thành loc.nguyenba@vti.com.vn
-- Question 15: update account có id = 5 sẽ thuộc group có id = 4



