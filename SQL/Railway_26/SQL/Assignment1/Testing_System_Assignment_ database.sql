DROP DATABASE IF EXISTS Testing_System_Assignment_2;   
CREATE DATABASE Testing_System_Assignment_2;
USE Testing_System_Assignment_2;     

CREATE TABLE Department (
Department_ID 		TINYINT unsigned auto_increment primary key,
Department_Name 	VARCHAR(50)   NOT NULL UNIQUE KEY
);
INSERT INTO Department (Department_Name)
VALUES  	("SALE"),
			("HR"),
			("Marketing"),                         
			(" bảo vệ"),
			("Shareholder");

CREATE TABLE Position ( 
Position_ID 		TINYINT auto_increment primary key,          
Position_Name 		VARCHAR (50) NOT NULL UNIQUE KEY 
); 

INSERT INTO Position (Position_Name)
VALUES  		("GIAM DOC"),
				("TRUONG PHONG"),
				("PHO PHONG"), 
				("THU KY"),
                ("TAI CHINH"),
                ("NHAN VIEN"),
                ("QUAN LY"),
                ("QUAN DOC"),
                ("HOC VU");
          
CREATE TABLE `Account`( 	
Account_ID 			TINYINT unsigned auto_increment primary key, -- primary key -> Unique
Email 				VARCHAR (50) NOT NULL ,
Username 			VARCHAR (50) NOT NULL ,
Fullname 			VARCHAR (50) NOT NULL,
Department_ID 		TINYINT UNSIGNED NOT NULL,
Position_ID  		TINYINT UNSIGNED NOT NULL,		
CreateDate			DATETIME ,
FOREIGN KEY (Department_ID) REFERENCES `Department`(Department_ID)
);

INSERT INTO `Account` ( Email, Username, Fullname, Department_ID, Position_id, CreateDate )
VALUES    	('Hoanglong712@gmail.com', 'Hoanglong', 'DanghoangLong', 1,1,20211107),
			('Hacam123@gmail.com', 'Hacam', 'NguyenHacam', 5,0,20211108),
			('Longhoang123@gmail.com', 'Longhoang', 'TranLonghoang', 2,2,20211109),
			('Danglong123@gmail.com', 'Danglong', 'HoangDanglong', 2,8,2021110),
			('Tranlong123@gmail.com', 'Tranlong', 'DangTranlong', 2,1,20211111),
			('Hoangcau123@gmail.com', 'Hoangcau', 'DangHoangcau', 3,7,20211112),
			('ChuDu123@gmail.com', 'ChuDu', 'NguyenChuDu', 2,1,20211113),
			('Tieukieu123@gmail.com', 'Tieukieu', 'TranTieukieu', 3,2,20211114),
			('Quanvu123@gmnvu','Quanvu', 'DangQuanvu', 4,3,20211115),
			('Truongphi123@gmail.com', 'Truongphi', 'TranTruongphi', 3,3,20211116),
			('Luubi123@gmail.com', 'Luubi', 'HoangLuubi', 2,4,20211117);
            
CREATE TABLE `Group` ( 
Group_id 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
GroupName			VARCHAR(50) UNIQUE KEY,
Creator_id 			TINYINT UNSIGNED UNIQUE KEY,
CreateDate   		DATE

);

INSERT INTO  `Group`(GroupName, Creator_id, CreateDate)
VALUES 
	('Gr1',1,20201102	),
	('Gr2',2,20201101	),
	('Gr3',3,20201105	),
	('Gr4',4,20201108	),
	('Gr5',5,20211106	),
	('Gr6',6,20211102	),
    ('Gr7',7,20211106	);

CREATE TABLE GroupAcount (
Group_id 			TINYINT UNSIGNED, -- AUTO_INCREMENT <- khóa chính (PRIMARY KEY) 
Account_id			TINYINT UNSIGNED,
JoinDate 			DATE,
FOREIGN KEY (Group_id) REFERENCES  `Group`(Group_id),
FOREIGN KEY (Account_id) REFERENCES `Account`(Account_ID)
);
INSERT INTO GroupAcount (Account_id, JoinDate)
VALUE 
	(1,20201102		),
    (3,20201101		),
    (6,20201105		),
    (4,20201108		),
    (8,20211106		),
    (2,20211102		),
    (5,20211106		);
    
CREATE TABLE TypeQuestion (
Type_id 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
TypeName			VARCHAR(50) UNIQUE KEY
);
INSERT INTO TypeQuestion(TypeName)
VALUE 	
	('Essay'			),
    ('True-False'		),
    ('Short-Answer'		),
    ('Fill-in-the-blank'),
    ('Matching'			),
    ('Multiple-Choice'	);
    
CREATE TABLE CategoryQuestion(
Category_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName 		varchar(50) UNIQUE KEY
);
INSERT INTO CategoryQuestion(CategoryName )
VALUE 
	('Java'		),
    ('.NET'		),
    ('SQL'		),
    ('Postman'	),
    ('Ruby'		);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
Question_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content 			VARCHAR(200) NOT NULL,
Category_id 		TINYINT UNSIGNED,
Type_id 			TINYINT UNSIGNED,
Creator_id 			TINYINT UNSIGNED,
CreateDate 			DATE NOT NULL,
FOREIGN KEY (Category_id) REFERENCES CategoryQuestion (Category_id),
FOREIGN KEY (Type_id) REFERENCES TypeQuestion (Type_id),
FOREIGN KEY (Creator_id) REFERENCES  `Account`(Account_id)
);
INSERT INTO Question(Content, Category_id, Type_id, Creator_id, CreateDate)
VALUE
	('Question1', 1, 1, 1, 20211110),
    ('Question2', 2, 2, 3, 20211220),
    ('Question3', 3, 3, 5, 20211110),
    ('Question4', 4, 4, 7, 20211110),
    ('Question5', 5, 5, 8, 20211220),
    ('Question6', 4, 6, 1, 20211110),
    ('Question7', 2, 5, 3, 20211110),
    ('Question8', 1, 4, 5, 20211220),
    ('Question9', 2, 3, 7, 20211110),
	('Question10', 3, 2, 1, 20211110);


CREATE TABLE Answer(
Answer_id 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content 			VARCHAR(50) NOT NULL,
Question_id 		TINYINT UNSIGNED UNIQUE KEY,
isCorrect			ENUM('TRUE', 'FALES', 'UNKNOWN'),
FOREIGN KEY (Question_id) REFERENCES Question (Question_id)
);
INSERT INTO Answer(Content, Question_id, isCorrect)
VALUE
	('Answer1', 1, 'TRUE'		),
    ('Answert2', 2, 'FALES'		),
    ('Answer3', 3, 'UNKNOWN'	),
    ('Answer4', 4, 'TRUE'		),
    ('Answer5', 5, 'FALES'		),
    ('Answer6', 6, 'TRUE'		),
    ('Answer7', 7, 'UNKNOWN'	),
    ('Answer8', 8, 'TRUE'		),
    ('Answer9', 9, 'FALES'		),
    ('Answer15', 10, 'UNKNOWN'	);


CREATE TABLE Exam (
Exam_id 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`Code` 				VARCHAR(20) NOT NULL,
Title				VARCHAR(200) NOT NULL,
Category_id 		TINYINT UNSIGNED,
Duration 			TINYINT UNSIGNED NOT NULL,
Creator_id 			TINYINT UNSIGNED,
CreateDate 			DATE,
FOREIGN KEY(Category_id) REFERENCES CategoryQuestion(Category_id),
FOREIGN KEY (Creator_id) REFERENCES `Account`(Account_id)
);
INSERT INTO Exam (`Code`, Title, Category_id, Duration, Creator_id, CreateDate)
VALUES 
	('Code1', ' bao h co ny', 1, 45, 1, 20201010),
    ('Code2', ' bao h co ny', 2, 60, 2, 20201110),
    ('Code3', ' bao h co ny', 3, 30, 4, 20201210),
    ('Code4', ' ko bi cam sung', 4, 90, 5, 20210110),
    ('Code5', ' ko bi cam sung', 5, 45, 6, 20210210),
    ('Code6', ' ko bi cam sung', 4, 15, 7, 20210310),
    ('Code7', 'ko bi cam sung', 3, 15, 6, 20210410),
    ('Code8', ' ko bi cam sung', 2, 30, 5, 20210510),
    ('Code9', ' cham hoc ', 1, 45, 4, 20210610),
    ('Code10', ' cham hoc', 2, 60, 1, 20210810);

CREATE TABLE ExamQuestion(
Exam_id 			TINYINT UNSIGNED ,
Question_id 		TINYINT UNSIGNED,
FOREIGN KEY (Exam_id) REFERENCES Exam (Exam_id),
FOREIGN KEY(Question_id) REFERENCES Question (Question_id)
);
INSERT INTO ExamQuestion (Exam_id, Question_id )
VALUE
	(1,1	),
    (2,2	),
    (3,3	),
    (4,4	),
    (5,5	),
    (6,6	),
    (7,7	),
    (8,8	),
    (9,9	),
    (10,10	);
    


