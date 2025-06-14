#1: Create Database
CREATE DATABASE IF NOT EXISTS WorldDB;
USE WorldDB;

#2: Create Tables
# A Create Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);

# B Create Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(3,1),
    Country_Id INT,
    Country_name VARCHAR(50)
);

#3: Insert data
#A Insert 10 rows into Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9833520),
(2, 'India', 1380000000, 3287263),
(3, 'China', 1440000000, 9596961),
(4, 'Australia', 25600000, 7692024),
(5, 'Canada', 38000000, 9984670),
(6, 'UK', 68000000, 243610),
(7, 'Germany', 83000000, 357022),
(8, 'France', 67000000, 551695),
(9, 'Japan', 126000000, 377975),
(10, 'Brazil', 213000000, 8515767);

#B Insert 10 rows into Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'Anu', 'Akhil', 100000, 4.2, 1, 'USA'),
(2, 'Akhil', 'S', 200000, 4.8, 2, 'India'),
(3, 'Daksha', 'Akhil', 300000, 4.5, 3, 'China'),
(4, 'Nethan', 'Amruth', 150000, 3.9, 4, 'Australia'),
(5, 'Aron', 'Anosh', 120000, 4.0, 5, 'Canada'),
(6, 'Anosh', 'Sasi', 90000, 4.6, 6, 'UK'),
(7, 'Amruth', 'S', 130000, 4.7, 7, 'Germany'),
(8, 'Priyanka', 'Amruth', 80000, 3.8, 8, 'France'),
(9, 'Pushpa', 'sasi', 110000, 4.3, 9, 'Japan'),
(10, 'sasi', '', 140000, 4.1, 10, 'Brazil');

#4: Queries
#1  List the distinct country names from the Persons table
SELECT DISTINCT Country_name FROM Persons;

#2 Select first names and last names from the Persons table with aliases
SELECT Fname AS 'First Name', Lname AS 'Last Name' FROM Persons;

#3 Find all persons with a rating greater than 4.0
SELECT * FROM Persons WHERE Rating > 4.0;

#4 Find countries with a population greater than 10 lakhs
SELECT * FROM Country WHERE Population > 1000000;

#5 Find persons who are from 'USA' or have a rating greater than 4.5
SELECT * FROM Persons 
WHERE Country_name = 'USA' OR Rating > 4.5;

#6 Find all persons where the country name is NULL
SELECT * FROM Persons 
WHERE Country_name IS NULL;

#7 Find all persons from the countries 'USA', 'Canada', and 'UK'
SELECT * FROM Persons 
WHERE Country_name IN ('USA', 'Canada', 'UK');

#8 Find all persons not from the countries 'India' and 'Australia'
SELECT * FROM Persons 
WHERE Country_name NOT IN ('India', 'Australia');

#9 Find all countries with a population between 5 lakhs and 20 lakhs
SELECT * FROM Country 
WHERE Population BETWEEN 500000 AND 2000000;

#10 Find all countries whose names do not start with 'C'
SELECT * FROM Country 
WHERE Country_name NOT LIKE 'C%';
