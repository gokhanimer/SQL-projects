                          --VR Startup Company--
--Start by familiarizing yourself with the tables. Examine the data from the employees table.
SELECT * 
FROM employees;

--Do you think there’s a way to join the two tables?
SELECT * 
FROM projects;

--What are the names of employees who have not chosen a project?
SELECT first_name, last_name
FROM employees
WHERE current_project IS NULL;

--What are the names of projects that were not chosen by any employees?
SELECT project_name 
FROM projects
WHERE project_id NOT IN (
   SELECT current_project
   FROM employees
   WHERE current_project IS NOT NULL);

--What is the name of the project chosen by the most employees?
SELECT project_name
FROM projects
INNER JOIN employees 
  ON projects.project_id = employees.current_project
WHERE current_project IS NOT NULL
GROUP BY project_name
ORDER BY COUNT(employee_id) DESC
LIMIT 1;

--Which projects were chosen by multiple employees?
SELECT project_name
FROM projects
INNER JOIN employees 
  ON projects.project_id = employees.current_project
WHERE current_project IS NOT NULL
GROUP BY current_project
HAVING COUNT(current_project) > 1;

--Each project needs at least 2 developers. How many available project positions are there for developers? Do we have enough developers to fill the needed positions? We will learn how to do this in the last chapters of this course! Take a look at the hint to get a preview.
SELECT (COUNT(*) * 2) - (
  SELECT COUNT(*)
  FROM employees
  WHERE current_project IS NOT NULL
    AND position = 'Developer') AS 'Count'
FROM projects;
