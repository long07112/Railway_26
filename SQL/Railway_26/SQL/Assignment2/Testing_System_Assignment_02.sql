DROP DATABASE Testing_System_Assignment_02;
CREATE DATABASE Testing_System_Assignment_02;
USE Testing_System_Assignment_02;

CREATE TABLE Department (
Department_ID 		TINYINT auto_increment primary key,
Department_Name 	VARCHAR(50) UNIQUE KEY
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
Account_ID 			TINYINT auto_increment primary key UNIQUE KEY,
Email 				VARCHAR (50) NOT NULL,
Username 			VARCHAR (50) NOT NULL,
Fullname 			VARCHAR (50) NOT NULL,
Department_ID 		TINYINT UNSIGNED,
Position_ID  		TINYINT UNSIGNED,			
CreateDate			DATETIME ,
FOREIGN KEY (Department_id) REFERENCES `Department`(Department_id)
);

INSERT INTO `Account` ( Email, Username, Fullname, Department_ID, Position_id, CreateDate )
VALUE   ('Hoanglong712@gmail.com', 'Hoanglong', 'DanghoangLong', 7,1,20211107),
		('Hacam123@gmail.com', 'Hacam', 'NguyenHacam', 5,0,20211108),
		('Longhoang123@gmail.com', 'Longhoang', 'TranLonghoang', 8,2,20211109),
		('Danglong123@gmail.com', 'Danglong', 'HoangDanglong', 2,8,2021110),
		('Tranlong123@gmail.com', 'Tranlong', 'DangTranlong', 0,1,20211111),
		('Hoangcau123@gmail.com', 'Hoangcau', 'DangHoangcau', 3,7,20211112),
		('ChuDu123@gmail.com', 'ChuDu', 'NguyenChuDu', 2,1,20211113),
		('Tieukieu123@gmail.com', 'Tieukieu', 'TranTieukieu', 5,2,20211114),
		('Quanvu123@gmail.com', 'Quanvu', 'DangQuanvu', 9,3,20211115),
		('Truongphi123@gmail.com', 'Truongphi', 'TranTruongphi', 3,3,20211116),
		('Luubi123@gmail.com', 'Luubi', 'HoangLuubi', 2,4,20211117);
	
    CREATE TABLE Groupv(
Group_ID 			TINYINT auto_increment primary key,
Group_Name 			VARCHAR (50) NOT NULL,
Creator_ID 			TINYINT,
CreateDate			DATETIME,
FOREIGN KEY (Creator_id) REFERENCES  `Account`(Account_id)
);

INSERT INTO  `Group`(GroupName, Creator_id, CreateDate)
VALUE 
	('Gr1',1,20211107),
	('Gr2',2,20211111),
	('Gr3',3,20211120),
	('Gr4',3,20211101),
    ('Gr5',3,20211102),
    ('Gr6',3,20211103),
    ('Gr7',3,20211104),
    ('Gr9',3,20211105);
    
CREATE TABLE GroupAccount (
Group_ID 			TINYINT,
Account_ID 			TINYINT UNSIGNED NOT NULL,
JoinDate 			DATETIME, PRIMARY KEY (Group_ID,Account_ID),
FOREIGN KEY (Group_id ) REFERENCES  `Group`(Group_id ),
FOREIGN KEY (Account_ID ) REFERENCES  `Account`(Account_ID ) 
);

INSERT INTO  GroupAccount (Account_ID ,JoinDate  )
VALUE 	(1,20201102	),
		(2,20201101	),
		(3,20201105	),
		(4,20201108	),
		(5,20211106	),
		(6,20211102	),
		(7,20211106	);



    
    
    
    
    
    
    
    