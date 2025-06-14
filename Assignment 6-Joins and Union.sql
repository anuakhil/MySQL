# 1 Perform INNER JOIN, LEFT JOIN, and RIGHT JOIN 
SELECT P.Id, P.Fname, P.Lname, P.Rating, C.Country_name, C.Population, C.Area
#INNER JOIN
FROM Persons P
INNER JOIN Country C
ON P.Country_name = C.Country_name;

#LEFT JOIN
SELECT P.Id, P.Fname, P.Lname, P.Rating, C.Country_name, C.Population, C.Area
FROM Persons P
LEFT JOIN Country C
ON P.Country_name = C.Country_name;

#RIGHT JOIN
SELECT P.Id, P.Fname, P.Lname, P.Rating, C.Country_name, C.Population, C.Area
FROM Persons P
RIGHT JOIN Country C
ON P.Country_name = C.Country_name;

#2  List all distinct country names from both tables
SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT Country_name FROM Persons;

#3 List all country names from both tables, including duplicates
SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

#4 Round the ratings of all persons to the nearest integer
#a) To just select the rounded values:
SELECT Id, Fname, Lname, ROUND(Rating) AS Rounded_Rating
FROM Persons;

#b) To update the table (if you want to permanently round and store):
UPDATE Persons
SET Rating = ROUND(Rating);
