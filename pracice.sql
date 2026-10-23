CREATE TABLE projects (
    project_id   INT PRIMARY KEY,
    project_name VARCHAR(50),
    budget       INT
);

CREATE TABLE developers (
    dev_id       INT PRIMARY KEY,
    dev_name     VARCHAR(50),
    project_id   INT,
    mentor_id    INT
);


INSERT INTO projects (project_id, project_name, budget) VALUES
(101, 'AI Assistant', 50000),
(102, 'Payment Gateway', 35000),
(103, 'Cloud Migration', 60000);   


INSERT INTO developers (dev_id, dev_name, project_id, mentor_id) VALUES
(1, 'Arjun', 101, NULL),    
(2, 'Sara',  101, 1),       
(3, 'Kabir', 102, 1),       
(4, 'Rhea',  NULL, 2),      
(5, 'Zoya',  999, 3);     


SELECT * FROM projects;

SELECT * from developers;


-- INNER JOINS
SELECT 
    d.dev_id,
    d.dev_name,
    p.project_name,
    p.budget
FROM developers d
INNER JOIN projects p 
    ON d.project_id = p.project_id;


--LEFT JOINS

SELECT 
    d.dev_id,
    d.dev_name,
    p.project_name,
    p.budget
FROM developers d
LEFT JOIN projects p 
    ON d.project_id = p.project_id;


--RIGHT JOINS

SELECT 
    d.dev_name,
    p.project_id,
    p.project_name,
    p.budget
FROM developers d
RIGHT JOIN projects p 
    ON d.project_id = p.project_id;


--FULL OUTER JOINS
SELECT 
    d.dev_name,
    d.project_id AS dev_project_id,
    p.project_id AS actual_project_id,
    p.project_name
FROM developers d
FULL OUTER JOIN projects p 
    ON d.project_id = p.project_id;



--CROSS JOINS

SELECT 
    d.dev_name,
    p.project_name
FROM developers d
CROSS JOIN projects p;
