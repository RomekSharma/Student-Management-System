Create database Student_Managment_System;
Use Student_Managment_System;
-------------------- Create Student Tabel-------------
Create Table Students (
student_id INT PRIMARY KEY IDENTITY (1, 1),------Auto Incrementing Primary Key
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR (50) NOT NULL,
email VARCHAR (100) UNIQUE NOT NULL,
enrollment_date DATE NOT NULL,
);
Create Table Courses (
course_id INT PRIMARY KEY IDENTITY (1, 1),
course_name NVARCHAR(100) NOT NULL,
instructor NVARCHAR(100) NOT NULL,
);
Create Table Grades (
grade_id INT PRIMARY KEY IDENTITY (1, 1),
student_id INT NOT NULL,
course_id INT NOT NULL,
grade CHAR(1) NOT NULL,
FOREIGN KEY (student_id) REFERENCES Students(student_id),
FOREIGN KEY (course_id) REFERENCES Courses(course_id),
);
INSERT INTO Students (first_name, last_name, email, enrollment_date)	
VALUES
('John','Doe','john.doe@example.com','2023-09-01'),
('Jane','Smith','jane.smith@example.com','2023-09-01'),
('Alice','Johnson','alice.johnson@example.com','2023-09-01');
INSERT INTO Courses (course_name, instructor)
VALUES
('Mathematics','Dr. Smith'),
('Computer Science','Prof. Johnson'),
('Physics','Dr. Brown');
INSERT INTO Grades (student_id, course_id, grade)
VALUES
(1, 1, 'A'),
(1, 2, 'B'), 
(2, 1, 'C'), 
(2, 3, 'A'), 
(3, 2, 'B'),
(3, 3, 'A');
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT
s.first_name,
s.last_name,
c.course_name,
g.grade
FROM Grades g
JOIN Students s ON g.student_id = s.student_id
JOIN Courses c ON g.course_id =	c.course_id
WHERE s.student_id = 1;
UPDATE Students
SET email = 'john.doe@example.com'
WHERE student_id = 1;
--Drop the existing foreign key constraint
ALTER TABLE Grades
DROP CONSTRAINT FK__Grades__course_i__534D60F1; 
--Recreate the foreign key with ON DELETE CASCADE
ALTER TABLE Grades
ADD CONSTRAINT FK_Grades_Courses
FOREIGN KEY (course_id)
REFERENCES Courses(course_id)
ON DELETE CASCADE;
DELETE FROM Courses
WHERE course_id = 2;
--Calculate Average Grade for each student
SELECT
s.student_id,
s.first_name,
s.last_name,
AVG(
CASE
	WHEN g.grade = 'A' THEN 4
	WHEN g.grade  = 'B' THEN 3
	WHEN g.grade = 'C' THEN 2
	WHEN g.grade = 'D'THEN 1
	ELSE 0
END) AS average_grade
FROM Students s
LEFT JOIN Grades g ON s.student_id = g.student_id
GROUP BY s.student_id, s.first_name, s.last_name;
SELECT * FROM Students
WHERE first_name LIKE '%John%' OR last_name LIKE '%John%';