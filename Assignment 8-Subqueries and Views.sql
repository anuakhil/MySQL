#1 Find the number of persons in each country
SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name;

#2  Find the number of persons in each country sorted from high to low
SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name
ORDER BY Number_of_Persons DESC;

#3 Find average rating per country where average is greater than 3.0
SELECT Country_name, AVG(Rating) AS Avg_Rating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

#4 Find countries with the same rating as the USA (using subquery)
SELECT Country_name 
FROM Persons
WHERE Rating = (
    SELECT Rating FROM Persons WHERE Country_name = 'USA' LIMIT 1
);

#5 Select countries whose population is greater than average population of all nations
SELECT Country_name, Population
FROM Country
WHERE Population > (
    SELECT AVG(Population) FROM Country
);

#1Create Product database and Customer table
CREATE DATABASE Product;
USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(20),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

#Insert sample data
INSERT INTO Customer VALUES
(1, 'Anu', 'Akhil', 'anu.akhil@gmail.com', '1234567890', '123 Elm St', 'Los Angeles', 'California', '90001', 'USA'),
(2, 'Akhil', 'S', 'akhils@gmail.com', '2234567890', '456 Oak St', 'San Francisco', 'California', '90002', 'USA'),
(3, 'Daksha', 'akhil', 'Dakshaakhil@gmail.com', '3234567890', '789 Pine St', 'New York', 'New York', '10001', 'USA'),
(4, 'Nethan', 'Amruth', 'nethanamruth@gmail.com', '4234567890', '321 Maple St', 'Chicago', 'Illinois', '60007', 'USA'),
(5, 'Priyanka', 'Amruth', 'priyankaamruth@gmail.com', '5234567890', '654 Cedar St', 'Dallas', 'Texas', '75001', 'USA'),
(6, 'Amruth', 'S', 'amruths@gmail.com', '6234567890', '987 Birch St', 'Houston', 'Texas', '77001', 'USA'),
(7, 'Anosh', 'Sasi', 'anoshsasi@gmail.com', '7234567890', '456 Walnut St', 'Phoenix', 'Arizona', '85001', 'USA'),
(8, 'Pushpa', 'Sasi', 'pushpasasi@gmail.com', '8234567890', '789 Ash St', 'Seattle', 'Washington', '98101', 'USA'),
(9, 'Aron', 'Anosh', 'aronanosh@gmail.com', '9234567890', '147 Spruce St', 'Boston', 'Massachusetts', '02101', 'USA'),
(10, 'Sasi', 'Tharol', 'sasitharol@gmail.com', '1034567890', '258 Redwood St', 'San Diego', 'California', '92101', 'USA');

#2 Create views
#(1) View: customer_info (Full Name and Email)
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM Customer;

#Query the view:
SELECT * FROM customer_info;

#(2) View: US_Customers
CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'USA';

#Query:
SELECT * FROM US_Customers;

#(3) View: Customer_details
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email, Phone_no, State
FROM Customer;

#Query:
SELECT * FROM Customer_details;

#3 Update phone numbers for customers in California
SET SQL_SAFE_UPDATES = 0;
UPDATE Customer 
SET Phone_no = '9999999999'
WHERE State = 'California';

#4 Count customers in each state where count > 5
SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

#5 Query: number of customers in each state from Customer_details view
SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer_details
GROUP BY State;

#6 Query: All columns from Customer_details view, sorted by state
SELECT * FROM Customer_details
ORDER BY State ASC;
