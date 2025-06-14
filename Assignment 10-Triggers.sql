# 1 — Create the teachers table and insert 8 rows
CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10,2)
);

INSERT INTO teachers (name, subject, experience, salary) VALUES
('Anil Kumar', 'Mathematics', 5, 45000),
('Suma Reddy', 'Physics', 12, 60000),
('Ravi Varma', 'Chemistry', 8, 50000),
('Meena Sharma', 'Biology', 15, 70000),
('Vikram Singh', 'English', 9, 48000),
('Priya Das', 'History', 7, 47000),
('Kiran Rao', 'Geography', 11, 55000),
('Arun Nair', 'Computer Science', 3, 40000);

# 2 Step 2 — Create the teacher_log table
CREATE TABLE teacher_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(50),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

# 3 Create before insert trigger to prevent negative salary
DELIMITER //

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END //

DELIMITER ;

# 4 Create after insert trigger to log insertion
DELIMITER //

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action)
    VALUES (NEW.id, 'INSERT');
END //

DELIMITER ;

# 5 Create before delete trigger to prevent deletion if experience > 10
DELIMITER //

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete teacher with experience greater than 10 years';
    END IF;
END //

DELIMITER ;

# 6 — Create after delete trigger to log deletion
DELIMITER //

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action)
    VALUES (OLD.id, 'DELETE');
END //

DELIMITER ;