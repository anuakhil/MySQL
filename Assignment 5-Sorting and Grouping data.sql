# 1 - Create Tables
# a Create Country table
CREATE TABLE Contry (
    Id INT PRIMARY KEY,
    Contry_name VARCHAR(50),
    Population INT,
    Area INT
);

#b Create Persons Table
CREATE TABLE Personss (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(3,1),
    Contry_Id INT,
    Contry_name VARCHAR(50)
);

#  2 — Insert 10 Rows into Both Tables
#a Insert into Country table
INSERT INTO Contry (Id, Contry_name, Population, Area) VALUES
(1, 'India', 1400000000, 3287263),
(2, 'USA', 331000000, 9833517),
(3, 'China', 1440000000, 9596961),
(4, 'Germany', 83000000, 357022),
(5, 'UK', 67000000, 243610),
(6, 'France', 67000000, 551695),
(7, 'Canada', 38000000, 9984670),
(8, 'Australia', 25000000, 7692024),
(9, 'Brazil', 213000000, 8515767),
(10, 'Russia', 146000000, 17098242);

#b Insert into Persons table
INSERT INTO Personss (Id, Fname, Lname, Population, Rating, Contry_Id, Contry_name) VALUES
(1, 'John', 'Doe', 10000, 4.5, 2, 'USA'),
(2, 'Jane', 'Smith', 8000, 3.9, 1, 'India'),
(3, 'Wei', 'Li', 12000, 4.7, 3, 'China'),
(4, 'Anya', 'Petrova', 9000, 4.2, 10, 'Russia'),
(5, 'Carlos', 'Silva', 7000, 3.8, 9, 'Brazil'),
(6, 'Emily', 'Brown', 15000, 4.9, 5, 'UK'),
(7, 'Mohammed', 'Ali', 11000, 3.5, 1, 'India'),
(8, 'Pierre', 'Dupont', 5000, 3.7, 6, 'France'),
(9, 'Sophie', 'Martin', 4000, 4.0, 6, 'France'),
(10, 'Lucas', 'White', 6000, 4.1, 7, 'Canada');

# 3 — Write SQL Queries
#1: Print first three characters of Country_name from Country table
SELECT LEFT(Contry_name, 3) AS FirstThreeChars FROM Contry;

#2: Concatenate first name and last name from Persons table
SELECT CONCAT(Fname, ' ', Lname) AS FullName FROM Personss;

#3: Count the number of unique country names from Persons table
SELECT COUNT(DISTINCT Contry_name) AS UniqueContries FROM Personss;

#4: Maximum population from Country table
SELECT MAX(Population) AS MaxPopulation FROM Contry;

#5: Minimum population from Persons table
SELECT MIN(Population) AS MinPopulation FROM Personss;

#6: Insert 2 rows with NULL Lname and count Lname from Persons table
#a Insert 2 new rows
INSERT INTO Personss (Id, Fname, Lname, Population, Rating, Contry_Id, Contry_name) VALUES
(11, 'Raj', NULL, 7000, 3.2, 1, 'India'),
(12, 'Olga', NULL, 6000, 4.3, 10, 'Russia');

#b Count Lname (non-null values)
SELECT COUNT(Lname) AS CountOfLname FROM Personss;

# 7: Find the number of rows in the Persons table
SELECT COUNT(*) AS TotalRows FROM Personss;

# 8: Show population of Country table for first 3 rows
SELECT Population FROM Contry LIMIT 3;

# 9: Print 3 random rows of countries
SELECT * FROM Contry ORDER BY RAND() LIMIT 3; 

# 10: List all persons ordered by their rating descending
SELECT * FROM Personss ORDER BY Rating DESC;

# 11: Total population for each country in Persons table
SELECT Contry_name, SUM(Population) AS TotalPopulation
FROM Personss
GROUP BY Contry_name;

# 12: Countries in Persons table with total population greater than 50,000
SELECT Contry_name, SUM(Population) AS TotalPopulation
FROM Personss
GROUP BY Contry_name
HAVING SUM(Population) > 50000;

# 13: Total number of persons and average rating for each country (only for countries with more than 2 persons, ordered by average rating ascending)
SELECT Contry_name, COUNT(*) AS TotalPersonss, AVG(Rating) AS AverageRating
FROM Personss
GROUP BY Contry_name
HAVING COUNT(*) > 2
ORDER BY AverageRating ASC;