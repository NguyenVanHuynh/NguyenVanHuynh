-- Tạo 1 File SQL đặt tên là "Testing_System_Assignment_Huynh"
Create database Testing_System_Assignment_Huynh ;
Use Testing_System_Assignment_Huynh ;

-- Tạo Table 1:Department
create table Department (
DepartmentID int,
DepartmentName varchar(50) );

-- Tạo Table :Position
CREATE TABLE Position (
    PositionID 			INT,
    PositionName 		VARCHAR(50)
);

-- Tạo Table : Account
CREATE TABLE Account(
    AccountID 			INT,
    Email 				VARCHAR(50),
    Username 			VARCHAR(50),
    FullName 			VARCHAR(50),
    DepartmentID 		INT,
    PositionID 			INT,
    CreateDate 			DATE
);

-- Tạo Table : Group
CREATE TABLE 			`Group`(
    gropid INT AUTO_INCREMENT,
    GroupNamer 			VARCHAR(50),
    Creatorid 			INT,
    CreateDate 			DATE
);

-- Tạo Table : GroupAccount
CREATE TABLE GroupAccount (
    Groupid 			INT,
    Accountid 			INT,
    Joindate 			DATE
);

-- Tạo Table : Typequestion
CREATE TABLE Typequestion (
    Typeid 				INT,
    Typename 			VARCHAR(50)
);

-- Tạo Table : CategoryQuestion
CREATE TABLE CategoryQuestion (
    CategoryID 			INT,
    CategoryName 		VARCHAR(50)
);

-- Tạo Table : Question
CREATE TABLE Question (
    Questionid 			INT,
    Content 			VARCHAR(50),
    Categoryid 			INT,
    Typeid 				INT,
    Creatorid 			INT,
    Createdate 			DATE
);

-- Tạo Table :  Answer
CREATE TABLE Answer (
    Answerid 			INT,
    Content 			VARCHAR(50),
    Questionid 			INT,
    Iscorrect 			VARCHAR(10)
);

-- Tạo Table : Exam
CREATE TABLE Exam (
    Examid 				INT,
    `Code` 				VARCHAR(50),
    Title 				VARCHAR(50),
    CategoryID 			INT,
    Duration 			VARCHAR(50),
    CreatorID 			INT,
    CreateDate 			DATE
);

-- Tạo Table : ExamQuestion
CREATE TABLE ExamQuestion (
    ExamID 				INT,
    QuestionID 			INT
);

