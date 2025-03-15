# Student Management System

This is a SQL-based project to manage student records, courses, and grades.

## Project Overview
- **Purpose**: To store and manage student information, course details, and grades.
- **Database Schema**: Includes three tables: `Students`, `Courses`, and `Grades`.
- **Features**: Add, update, delete, and retrieve student and course records.

## Database Schema
![Database Schema](Screenshots/Schema.png)

## Example Queries
1. Retrieve all students:
   ```sql
   SELECT * FROM Students;

   Retrieve grades for a specific student:

SELECT s.first_name, s.last_name, c.course_name, g.grade
FROM Grades g
JOIN Students s ON g.student_id = s.student_id
JOIN Courses c ON g.course_id = c.course_id
WHERE s.student_id = 1;
