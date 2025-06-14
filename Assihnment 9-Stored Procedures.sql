# A Create the Worker Table
CREATE TABLE Workers (
    Workers_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);

# B Insert Sample Data
INSERT INTO Workers VALUES
(1, 'Daksha', 'Akhil', 50000, '2020-01-15', 'HR'),
(2, 'Aron', 'Anosh', 60000, '2019-03-22', 'IT'),
(3, 'Nethan', 'Amruth', 75000, '2018-05-10', 'Finance'),
(4, 'Upanya', 'Subash', 70000, '2021-07-11', 'IT'),
(5, 'Tapasya', 'Bineesh', 55000, '2022-09-30', 'HR');

#1 Stored Procedure to Insert New Worker
DELIMITER //

CREATE PROCEDURE AddWorkers (
    IN p_Workers_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Workers (Workers_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Workers_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //

DELIMITER ;

#Procedure Call

#2 Stored Procedure to Retrieve Salary Based on Worker_ID
#Procedure Creation
DELIMITER //

CREATE PROCEDURE GetSalaryByWorkersId (
    IN p_Workers_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary FROM Workers WHERE Workers_Id = p_Workers_Id;
END //

DELIMITER ;

#Procedure Call
-- Declare variable to hold output
SET @salary = 0;

-- Call procedure
CALL GetSalaryByWorkersId(3, @salary);

-- Check output
SELECT @salary;

#3 Stored Procedure to Update Department Based on Worker_ID
#Procedure Creation
DELIMITER //

CREATE PROCEDURE UpdateDepartmentByWorkersId (
    IN p_Workers_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Workers SET Department = p_Department WHERE Workers_Id = p_Workers_Id;
END //

DELIMITER ;

#Procedure Call
CALL UpdateDepartmentByWorkersId(2, 'Operations');

#4 Stored Procedure to Count Workers in Department
DELIMITER //

CREATE PROCEDURE GetWorkersCountByDepartment (
    IN p_Department CHAR(25),
    OUT p_WorkersCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkersCount FROM Workers WHERE Department = p_Department;
END //

DELIMITER ;

#Procedure Call
SET @count = 0;

CALL GetWorkersCountByDepartment('HR', @count);

SELECT @count;

#5 Stored Procedure to Get Average Salary in Department
DELIMITER //

CREATE PROCEDURE GetAvgSalaryByDepartment (
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary FROM Workers WHERE Department = p_Department;
END //

DELIMITER ;

#Procedure Call
SET @avg_salary = 0;

CALL GetAvgSalaryByDepartment('IT', @avg_salary);

SELECT @avg_salary;
