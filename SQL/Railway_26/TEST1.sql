DROP DATABASE IF EXISTS TestingExam1;   
CREATE DATABASE TestingExam1;
USE TestingExam1;     

CREATE TABLE CUSTOMER ( 
	CustomerID 	TINYINT unsigned auto_increment primary key,
	`Name`		VARCHAR(50)   NOT NULL,
	Phone  		INT ,
	Email 		VARCHAR(50)   NOT NULL,
	Address  	VARCHAR(50)   NOT NULL,
	Note        VARCHAR(50)   NOT NULL
 ); 
 
 INSERT INTO  CUSTOMER (`Name`,Phone,Email,Address,Note )
	VALUES  	('Hoanglong',096168666,'Hoanglong712@gmail.com','HANOI','DEPTRAI'),
				('CHUDU',096168555,'CHUDU123@gmail.com','HANOI','DEPTRAI'),
				 ('TIEUKIEU',09616844,'TIEUKIEU712@gmail.com','HANOI','DEPTRAI'),
				 ('TAOTHAO',096168333,'TAOTHAO712@gmail.com','HANOI','DEPTRAI'),
				 ('QUANVU',096168667,'QUANVU712@gmail.com','HANOI','DEPTRAI'),
				 ('LUUBI',096168668,'LUUBI712@gmail.com','HANOI','DEPTRAI'),
				 ('TRUONGPHI',096168669,'TRUONGPHI712@gmail.com','HANOI','DEPTRAI'),
				 ('BANGTHONG',096168664,'BANGTHONG712@gmail.com','HANOI','DEPTRAI'),
				 ('TONGGIANG',096168663,'TONGGIANG712@gmail.com','HANOI','DEPTRAI'),
				 ('VANCUONG',096168662,'VANCUONG712@gmail.com','HANOI','DEPTRAI'); 
                 
 CREATE TABLE CAR ( 
 CarID 			TINYINT unsigned auto_increment primary key,
 Maker 			VARCHAR(50)   NOT NULL,
 Model 			VARCHAR(50)   NOT NULL,
 `Year` 		INT,
 Color 			VARCHAR(10)   NOT NULL,
 Note			VARCHAR(50)   NOT NULL
 ); 
 
 INSERT INTO CAR ( Maker,Model,`Year`,Color,Note)
	VALUES  	('TOYOTA', 'CAMRY','2020','WHITE','Khong_co_gi'),
				('HONDA','accord','2020','BLACK','khong_co_gi'),
				('HONDA','honda sv','2020','BLACK','khong_co_gi'),
				('TOYOTA', 'alstic','2020','WHITE','Khong_co_gi'),
				('NISSAN', 'lemon','2020','WHITE','Khong_co_gi'); 
                 
 CREATE TABLE CAR_ORDER ( 
 OrderID 	TINYINT unsigned auto_increment primary key,
 CustomerID  TINYINT unsigned,	
 CarID  	TINYINT unsigned,	
 Amount    TINYINT unsigned DEFAULT 1,
 SalePrice 	INT ,
 OrderDate  DATE,
 DeliveryDate DATE,
 DeliveryAddress 	VARCHAR(100)  DEFAULT 1  ,
 Staus    			VARCHAR(10)   NOT NULL,  -- ngầm dịnh hiểu
 Note 				VARCHAR(50)   NOT NULL, 
 FOREIGN KEY (CustomerID) REFERENCES  CUSTOMER(CustomerID),
  FOREIGN KEY (CarID) REFERENCES CAR(CarID) 
  ); 
  
  
 INSERT INTO CAR_ORDER (CustomerID ,CarID, Amount ,SalePrice,OrderDate,		DeliveryDate,	Staus,	Note   )
	VALUES 				 (1,		1,		1,			5000,	20211107,		20211121,		1,'	OK'),
			(2,1,1,2000,20211108,20211127,2,'OK'),
			(2,1,1,2000,20211109,20211120,0,'OK'),
			(1,1,1,5000,20211110,20211124,1,'OK'),
			(3,1,1,3000,20211112,20211119,1,'OK'),
			(1,1,1,5000,20211103,20211121,2,'OK'),
			(4,1,1,1000,20211104,20211128,2,'OK'),
			(3,1,1,3000,20211108,20211120,1,'OK'),
			(4,1,1,1000,20211107,20211120,1,'OK'), 
			(4,1,1,1000,20211112,20211120,1,'OK');
    
    
 -- câu 2   Viết lệnh lấy ra thông tin của khách hàng: tên, số lượng oto khách hàng đã
-- mua và sắp sếp tăng dần theo số lượng oto đã mua. 
 
 SELECT C.*, COUNT(D.Amount) SL_CAR
FROM customer C  
JOIN car_order D ON C.CustomerID = D.CustomerID
GROUP BY C.`Name`
ORDER BY COUNT(D.Amount) ASC;   
