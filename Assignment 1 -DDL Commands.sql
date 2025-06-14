#Create the Database
CREATE DATABASE School;

#Use the Database
USE School;

#Create the STUDENT table
CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(1)
);

#Insert sample data into STUDENT table
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade)
VALUES 
(1, 'Anu', 85, 'A'),
(2, 'Akhil', 76, 'B'),
(3, 'Daksha', 92, 'A'),
(4, 'Aron', 65, 'C'),
(5, 'Nethan', 55, 'D');

#Display the data using SELECT
SELECT * FROM STUDENT;

#Add a column named Contact
ALTER TABLE STUDENT
ADD Contact VARCHAR(15);

#verify the new structure:
DESC STUDENT;

#Remove the column Grade
ALTER TABLE STUDENT
DROP COLUMN Grade;

#Verify again:
DESC STUDENT;

#Rename the table from STUDENT to CLASSTEN
RENAME TABLE STUDENT TO CLASSTEN;

#Verify table rename
SHOW TABLES;

#Delete all rows from the table
TRUNCATE TABLE CLASSTEN;

#Verify:
SELECT * FROM CLASSTEN;

#Drop the table
DROP TABLE CLASSTEN;


