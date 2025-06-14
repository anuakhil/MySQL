#1: Add a new column called DOB in Persons table
ALTER TABLE Persons
ADD DOB DATE;

#2 : Insert sample DOB data 
UPDATE Persons SET DOB = '1990-05-12' WHERE Id = 1;
UPDATE Persons SET DOB = '1985-09-25' WHERE Id = 2;
UPDATE Persons SET DOB = '2000-03-15' WHERE Id = 3;
UPDATE Persons SET DOB = '1995-12-01' WHERE Id = 4;

#3: Create a user-defined function to calculate age using DOB
DELIMITER //

CREATE FUNCTION CalculateAge(dob DATE) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END //

DELIMITER ;

#4: Write a SELECT query to fetch the Age of all persons using the function
SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM Persons;

#5: Find the length of each country name in the Country table
SELECT Id, Country_name, LENGTH(Country_name) AS NameLength
FROM Country;

#6: Extract the first three characters of each country's name in the Country
SELECT Id, Country_name, LEFT(Country_name, 3) AS FirstThreeChars
FROM Country;

# 7: Convert all country names to UPPERCASE and lowercase in the Country
#To display in UPPERCASE:
SELECT Id, Country_name, UPPER(Country_name) AS UpperCaseName
FROM Country;

#To display in lowercase:
SELECT Id, Country_name, LOWER(Country_name) AS LowerCaseName
FROM Country;

#