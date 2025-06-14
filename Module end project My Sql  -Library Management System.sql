# 1: Create Database
CREATE DATABASE library;
USE library;

# 2: Create Tables
#1 Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(100),
    Contact_no VARCHAR(15)
);

#2 Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

#3 Books Table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(100),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10,2),
    Status VARCHAR(3),
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);

#4️ Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(100),
    Reg_date DATE
);

#5 IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

#6  ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

# 3: Insert Sample Data
#Branch Table
INSERT INTO Branch VALUES 
(1, 101, 'Delhi', '1234567890'),
(2, 102, 'Mumbai', '2345678901'),
(3, 103, 'Chennai', '3456789012');

#Employee Table
INSERT INTO Employee VALUES
(201, 'Ravi Kumar', 'Manager', 60000, 1),
(202, 'Sunita Sharma', 'Assistant', 40000, 1),
(203, 'Amit Verma', 'Manager', 55000, 2),
(204, 'Pooja Rani', 'Clerk', 30000, 2),
(205, 'Anil Mehta', 'Manager', 70000, 3),
(206, 'Sonia Gupta', 'Clerk', 32000, 3);

#Books Table
INSERT INTO Books VALUES
('B101', 'Data Structures', 'Education', 50.00, 'Yes', 'Mark Allen', 'Pearson'),
('B102', 'History of India', 'History', 30.00, 'Yes', 'R.S. Sharma', 'Penguin'),
('B103', 'C Programming', 'Education', 45.00, 'No', 'Dennis Ritchie', 'Wiley'),
('B104', 'World War II', 'History', 35.00, 'Yes', 'John Keegan', 'Harper'),
('B105', 'Harry Potter', 'Fiction', 60.00, 'No', 'J.K. Rowling', 'Bloomsbury');

#Customer Table
INSERT INTO Customer VALUES
(301, 'Arjun Patel', 'Ahmedabad', '2021-05-15'),
(302, 'Priya Das', 'Kolkata', '2022-03-20'),
(303, 'Suresh Rao', 'Hyderabad', '2023-01-10'),
(304, 'Meena Iyer', 'Pune', '2021-12-01'),
(305, 'Vikas Sharma', 'Delhi', '2023-06-05');

#IssueStatus Table
INSERT INTO IssueStatus VALUES
(401, 301, 'Data Structures', '2023-06-10', 'B101'),
(402, 302, 'C Programming', '2023-07-15', 'B103'),
(403, 305, 'World War II', '2023-06-18', 'B104');

#ReturnStatus Table
INSERT INTO ReturnStatus VALUES
(501, 301, 'Data Structures', '2023-06-20', 'B101'),
(502, 302, 'C Programming', '2023-07-25', 'B103');

# 4: Write Required Queries
# Query 1: Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'Yes';

#Query 2: List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;

#Query 3: Retrieve the book titles and the corresponding customers who have issued those books.
SELECT b.Book_title, c.Customer_name 
FROM Books b 
JOIN IssueStatus i ON b.ISBN = i.Isbn_book
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

#Query 4: Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Books 
FROM Books 
GROUP BY Category;

#Query 5: Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position 
FROM Employee 
WHERE Salary > 50000;

#Query 6: List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name 
FROM Customer 
WHERE Reg_date < '2022-01-01' 
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

#Query 7: Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee 
GROUP BY Branch_no;

#Query 8: Display the names of customers who have issued books in the month of June 2023.
SELECT c.Customer_name 
FROM Customer c 
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust 
WHERE MONTH(Issue_date) = 6 AND YEAR(Issue_date) = 2023;

#Query 9: Retrieve book_title from book table containing history.
SELECT Book_title 
FROM Books 
WHERE Category LIKE '%History%';

#Query 10: Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee 
GROUP BY Branch_no 
HAVING COUNT(*) > 5;

#Query 11: Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT e.Emp_name, b.Branch_address 
FROM Employee e 
JOIN Branch b ON e.Emp_Id = b.Manager_Id;

#Query 12: Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT c.Customer_name 
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
JOIN Books b ON i.Isbn_book = b.ISBN
WHERE b.Rental_Price > 25;
