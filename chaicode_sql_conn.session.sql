CREATE TABLE Employees (
    Employee_id SERIAL PRIMARY KEY,
    Employee_name VARCHAR(50) NOT NULL,
    Email_id VARCHAR(100) NOT NULL UNIQUE,
    Phone_no VARCHAR(20),
    Salary INT CHECK(Salary > 0),
    BIO TEXT,
    JOB_Title VARCHAR(100) NOT NULL,
Employee_status VARCHAR(30) NOT NULL DEFAULT 'Active' CHECK(
        EMPLOYEE_STATUS IN ('Active', 'Inactive', 'Terminated', 'On leave')
    ),
    departments_id INT REFERENCES departments(departments_id),
    manager_id INT REFERENCES departments(manager_id)
    
);
INSERT INTO Employees(
        Employee_name,
        Email_id,
        Phone_no,
        Salary,
        BIO,
        JOB_Title
    )
VALUES (
        'Piyush',
        'piyush@gmail.com',
        '9876543210',
        500000,
        'Software Engineer',
        'Software Engineer'
    ),
    (
        'Ramjivan',
        'Ram@gmail.com',
        '8619872787',
        230000000,
        'FRONTEND Engineer',
        'FULLSTACK Engineer'
    ),
    (
        'Prakhar',
        'Prakhar@gmail.com',
        '8765432109',
        450000,
        'BACKEND Engineer',
        'BACKEND Engineer'
    ),
    (
        'Aniket',
        'Aniket@gmail.com',
        '9876543210',
        1200000,
        'IT Engineer',
        'IT Engineer'
    ),
    (
        'Aman',
        'Aman@gmail.com',
        '9876543210',
        340000,
        'GITHUB Engineer',
        'GITHUB Engineer'
    );
SELECT *
FROM Employees;

ALTER TABLE employees 
ADD COLUMN INTERNAL_NOTE VARCHAR(30) NOT NULL DEFAULT 'N/A';

ALTER TABLE employees 
RENAME COLUMN internal_note TO INTERNAL_NOTES

SELECT*FROM Employees;

ALTER TABLE employees
DROP COLUMN INTERNAL_NOTES;


-- Create sample tables
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    course_id INT
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);



