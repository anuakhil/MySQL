#1️ Create Table with Constraints
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age >= 18 AND Age <= 65),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Gender ENUM('Male', 'Female', 'Other'),
    Department VARCHAR(50),
    Salary DECIMAL(10,2) NOT NULL
);

#2 Insert 10 Rows into Managers Table
INSERT INTO Managers (Manager_Id, First_name, Last_name, DOB, Age, Gender, Department, Salary)
VALUES
(1, 'Anu', 'Akhil', '1992-12-09', 32, 'Female', 'IT', 40000),
(2, 'Akhil', 'S', '1989-06-25', 36, 'Male', 'Design', 30000),
(3, 'Daksha', 'Akhil', '2009-02-13', 34, 'Male', 'HR', 28000),
(4, 'Priyanka', 'Amruth', '1988-03-22', 36, 'Female', 'Finance', 35000),
(5, 'Aron', 'Anosh', '1975-09-10', 49, 'Male', 'IT', 26000),
(6, 'Pushpa', 'sasi', '1992-11-05', 32, 'Female', 'Marketing', 32000),
(7, 'Nethan', 'Amruth', '1981-08-17', 43, 'Male', 'IT', 18000),
(8, 'Lalitha', 'TT', '1993-06-30', 31, 'Female', 'Operations', 24000),
(9, 'Anosh', 'Sasi', '1983-02-28', 41, 'Male', 'IT', 12000),
(10, 'Amruth', 'S', '1987-01-12', 37, 'Male', 'Finance', 22000);

#3Query 1: Retrieve name and DOB of manager with Manager_Id 1
SELECT First_name, Last_name, DOB 
FROM Managers 
WHERE Manager_Id = 1;

#4 Query 2: Display annual income of all managers
SELECT Manager_Id, First_name, Last_name, Salary, (Salary * 12) AS Annual_Income
FROM Managers;

#5 Query 3: Display records of all managers except ‘Daksha’
SELECT * 
FROM Managers 
WHERE First_name != 'Daksha';

#6 Query 4: Display managers in IT dept earning more than 25000
SELECT * 
FROM Managers 
WHERE Department = 'IT' AND Salary > 25000;

#7  Query 5: Display managers whose salary is between 10000 and 35000
SELECT * 
FROM Managers 
WHERE Salary BETWEEN 10000 AND 35000;

#8 
