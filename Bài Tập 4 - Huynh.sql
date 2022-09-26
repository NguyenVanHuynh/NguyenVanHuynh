-- Câu 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT 
 A.* , DepartmentName
FROM
    account A
       LEFT JOIN
    department D ON A.DepartmentID = D.DepartmentID; 
    
    
    -- Câu 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/1/2010
    select * From Account 
    where Createdate > '2020-4-1 00:00:00';
    
    
    -- Câu 3: Viết lệnh để lấy ra tất cả các developer

SELECT 
    A.*, PositionName
FROM
    position P
        RIGHT JOIN
    account A ON P.PositionID = A.PositionID
WHERE
    PositionName = 'Dev';
   
   
-- Câu 4: Viết lệnh để lấy ra danh sách các phòng ban có >2 nhân viên
 

SELECT 
    DepartmentName 
FROM
    Department D
        JOIN
    Account A ON D.DepartmentID = A.DepartmentID
GROUP BY DepartmentName
HAVING COUNT(A.DepartmentID) > 2;

-- Câu 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất 
SELECT 
    COUNT(*)
FROM
    examquestion EQ
GROUP BY EQ.ExamID
ORDER BY COUNT(*) DESC
LIMIT 1;
SELECT 
    Q.*, COUNT(EQ.ExamID) C
FROM
    question Q
        JOIN
    examquestion EQ ON Q.QuestionID = EQ.QuestionID
GROUP BY EQ.ExamID
HAVING C = 1;
    
    
    
-- Câu 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question:
SELECT 
    CQ.CategoryID, COUNT(QS.CategoryID) `Số câu hỏi sử dụng`
FROM
    CategoryQuestion CQ
        LEFT JOIN
    Question AS QS ON CQ.CategoryID = QS.CategoryID
GROUP BY CQ.CategoryID
ORDER BY CQ.CategoryID;


-- Câu 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT 
    QS.QuestionID, COUNT(EX.QuestionID) `Số Exam sử dụng` 
FROM
    Question QS
        LEFT JOIN
    Examquestion EX ON QS.QuestionID = EX.QuestionID
GROUP BY QS.QuestionID
ORDER BY QS.QuestionID;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhấT

SELECT 
    QS.QuestionID, QS.Content, AW.Content, COUNT(AnswerID)
FROM
    `Question` QS
		JOIN
    `Answer` AW ON QS.QuestionID = AW.QuestionID
GROUP BY AW.QuestionID
HAVING COUNT(AnswerID) = (SELECT 
        COUNT(AnswerID) AS total_answer_use
    FROM
        `Answer`
    GROUP BY QuestionID
    ORDER BY total_answer_use DESC
    LIMIT 1);
    
    
    -- Câu 9: Thống kê số lượng account trong mỗi group:
    SELECT 
    GR.*, COUNT(GA.AccountID) ` Số Lượng AC `
FROM
    `Group` GR
        LEFT JOIN
    GroupAccount GA ON GR.GroupID = GA.GroupID
GROUP BY GR.GroupID
ORDER BY GR.GroupID;

-- Câu 10: Tìm chức vụ có ít người nhất:
    SELECT DISTINCT
    PositionName, COUNT(AC.PositionID) AS `Số người`
FROM
    Position P
        LEFT JOIN
    Account AS ac ON P.PositionID = AC.PositionID
GROUP BY P.PositionName
ORDER BY `Số người` ASC
LIMIT 1;


-- Câu 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM： 
SELECT 
    DP.DepartmentID,
    DP.DepartmentName,
    AC.PositionID,
    PS.PositionName,
    COUNT(PositionName)  `Số lượng`
FROM
    Department DP
        JOIN
    Account AC ON DP.DepartmentID = AC.DepartmentID
         RIGHT JOIN
    Position PS ON PS.PositionID = AC.PositionID
GROUP BY DP.DepartmentID , PS.PositionID ;

-- Câu 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
-- question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...


-- Câu 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm:
  
   SELECT TQ.TypeID, TQ.TypeName, count(TQ.TypeID)  'Số lượng câu hỏi'
   FROM Typequestion AS TQ 
  RIGHT JOIN Question QS ON TQ.TypeID = QS.TypeID
   group by TQ.TypeID;

-- Câu 14: Lấy ra group không có account nào:
SELECT 
    GR.GroupID, GR.GroupName, GA.AccountID
FROM
    `group` GR
        LEFT JOIN
    Groupaccount GA ON GR.GroupID = GA.GroupID
WHERE
    GA.AccountID IS NULL;
    
    
-- Câu 15: Lấy ra group không có account nào:
SELECT 
    GR.GroupID, GR.GroupName, GA.AccountID
FROM
    `group` GR
        LEFT JOIN
    Groupaccount GA ON GR.GroupID = GA.GroupID
WHERE
    GA.AccountID IS NULL;

--    Câu 16: Lấy ra question không có answer nào

SELECT 
    QS.QuestionID,
    QS.Content  ' Nội Dung Câu Hỏi',
    AW.Content  'Nội Dung Câu Trả Lời'
FROM
    Question QS
        LEFT JOIN
    Answer AW ON QS.QuestionID = AW.QuestionID
WHERE
    AW.QuestionID IS NULL
