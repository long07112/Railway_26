DROP DATABASE Testing_System_Assignment_01;
CREATE DATABASE Testing_System_Assignment_01;
USE Testing_System_Assignment_01;

CREATE TABLE Department (
Department_ID 		TINYINT auto_increment primary key,
Department_Name 	VARCHAR(50) UNIQUE KEY
);
       
CREATE TABLE Position ( 
Position_ID 		TINYINT auto_increment primary key,          
Position_Name 		VARCHAR (50) NOT NULL
);

CREATE TABLE `Account`(
Account_ID 			TINYINT auto_increment primary key UNIQUE KEY,
Email 				VARCHAR (50) NOT NULL,
Username 			VARCHAR (50) NOT NULL,
Fullname 			VARCHAR (50) NOT NULL,
Department_ID 		TINYINT,
Position_ID 		TINYINT,
CreateDate			DATETIME 
);

CREATE TABLE Groupv(
Group_ID 			TINYINT auto_increment primary key,
Group_Name 			VARCHAR (50) NOT NULL,
Creator_ID 			TINYINT,
CreateDate			DATETIME
);

CREATE TABLE GroupAccount (
Group_ID 			TINYINT,
Account_ID 			TINYINT,
JoinDate 			DATETIME
);

CREATE TABLE TypeQuestion (
Type_ID 			TINYINT auto_increment primary key,
TypeName 			VARCHAR (50) NOT NULL
);

CREATE TABLE CategoryQuestion (
Category_ID 		INT,
CategoryName 		VARCHAR (50)
);

CREATE TABLE Question (
Question_ID 		TINYINT AUTO_INCREMENT PRIMARY KEY,
Content 			VARCHAR (300),
Category_ID 		TINYINT,
Type_ID 			INT,
Creator_ID 			INT,
CreateDate 			DATE
);

CREATE TABLE Answer (
Answer_ID 			INT,
Content 			VARCHAR (300),
QuestionID 			INT,
isCorrect 			VARCHAR (50)
);

CREATE TABLE Exam (
Exam_ID 			INT,
Code				INT,
Title 				VARCHAR (50),
Category_ID			INT,
Creator_ID 			INT,
CreateDate			DATE
);

CREATE TABLE ExamQuestion (
Exam_ID 			INT,
Question_ID 		INT
);