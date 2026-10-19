-- CREATE TABLE departments(
--     departments_id SERIAL PRIMARY KEY,
--     departments_name VARCHAR(50)NOT NULL,
--     manager_id INT
-- );
-- SELECT * FROM departments;

CREATE TABLE Employees (
    Employee_id SERIAL PRIMARY KEY,
    Employee_name VARCHAR(50) NOT NULL,
    Email_id VARCHAR(100) NOT NULL UNIQUE,
    Phone_no VARCHAR(20),
    Salary INT CHECK(Salary>0),
    BIO TEXT,
    JOB_Title VARCHAR(100) NOT NULL,
    Employee_status VARCHAR(30) NOT NULL DEFAULT 'Active'
       CHECK(EMPLOYEE_STATUS IN ('Active','Inactive','Terminated','On leave')),
    departments_id INT REFERENCES departments(departments_id),
    manager_id INT REFERENCES departments(manager_id)
);
INSERT INTO Employees(Employee_name, Email_id,Phone_no,Salary,BIO,JOB_Title,departments_id,manager_id)
VALUES
('Piyush','piyush@gmail.com','9876543210',500000,'Software Engineer','Software Engineer',1,1),
('Ramjivan','Ram@gmail.com','8619872787',230000000,'FRONTEND Engineer','FULLSTACK Engineer',2,2),
('Prakhar','Prakhar@gmail.com','8765432109',450000,'BACKEND Engineer','BACKEND Engineer',3,3),
('Aniket','Aniket@gmail.com','9876543210',1200000,'IT Engineer','IT Engineer',4,4),
('Aman','Aman@gmail.com','9876543210',340000,'GITHUB Engineer','GITHUB Engineer',5,5);

SELECT *FROM Employees;