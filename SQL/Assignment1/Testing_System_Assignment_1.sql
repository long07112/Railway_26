DROP DATABASE Testing_System_Assignment_1;

CREATE DATABASE Testing_System_Assignment_1;

USE Testing_System_Assignment_1; 

CREATE TABLE Department (
DepartmentID 		VARCHAR(50),
DepartmentName 		VARCHAR(50)
);

CREATE TABLE Position (
PositionID			VARCHAR(50),
PositionName		INT
);

CREATE TABLE Account (
AccountID			INT,
Email        		VARCHAR(50), 
Username     		VARCHAR(10),
FullName     		VARCHAR(50),
DepartmentID  		VARCHAR(50), 
PositionID     		VARCHAR(10),
CreateDate  		DATE 
);

CREATE TABLE GroupP (
GroupID 			INT,
GroupName      		VARCHAR(50), 
CreatorID     		VARCHAR(10),
CreateDate   	 	DATE 
);

CREATE TABLE GroupAccount (
GroupID 			INT,
AccountID  			VARCHAR(50), 
JoinDate   	 		DATE
);

CREATE TABLE TypeQuestion (
TypeID				VARCHAR(50)
); 
