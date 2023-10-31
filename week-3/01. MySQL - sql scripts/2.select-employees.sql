-- Northwind
-- 1. Downloading: https://github.com/breogann/databases
-- 2. Unzip: databases
-- 3. Import: Server > Data import > (select file) New (publications)

-- Marc, Esther, Ana, León, Martina

USE publications; -- schema
SELECT  * -- 1. COLUMNS
	FROM authors;  -- 2. TABLE
    
SELECT au_id, phone, city -- 1. Columns
	FROM authors; -- 2. table
    
SELECT au_id AS ID, phone, city
	FROM authors; -- It changes in the "print"
				  -- Result set
                  
     
SELECT au_id AS ID, phone AS telefono, city
	FROM authors;    
    
-- Choosing what columns
-- Choose columns based on the rows: filter

SELECT au_lname, au_fname, city
FROM authors
	WHERE city = "Oakland";
    
-- WHERE: filter. Marjorie
SELECT au_lname, au_fname, city
FROM authors
	WHERE city = "Oakland" 
	AND au_fname = "Marjorie";
    
-- Oakland or SF
SELECT au_lname, au_fname, city
	FROM authors
	WHERE city = "Oakland" OR city = "San Francisco";
    
SELECT *  
FROM authors
	WHERE city = "Oakland" OR city = "San Francisco";

-- You can filter by something
-- even if you're not selecting that something
SELECT au_lname, au_fname
	FROM authors
	WHERE city = "Oakland" OR city = "San Francisco";

-- Q: All columns but one
SELECT au_lname, au_fname, phone, address, city, state,
zip, contract
	FROM authors;
    
-- Multiple conditions
-- business AND price > 20
-- OR pyschology

-- titles
-- "Expensive-ish business " or psychology (no matter the price)
SELECT * 
	FROM titles
    WHERE (price > 10
		AND type = "business")
    OR type = "psychology";
-- without parenthesis
SELECT * 
	FROM titles
    WHERE price > 10
		AND type = "business"
    OR type = "psychology";

-- Business AND psych IF price for either is > 10
SELECT * 
	FROM titles
    WHERE price > 10
		AND (type = "business"
    OR type = "psychology");

-- employees
-- 1. Import employees
-- 2. New: employees
USE employees;
SELECT * from salaries;

SELECT * FROM employees;
-- All the women
SELECT * 
	FROM employees 
	WHERE gender = "F";
    
-- W,Nevin

SELECT * 
	FROM employees 
	WHERE gender = "F"
    AND FIRST_NAME = "Nevin";

-- Uppercase when filtering
-- SQL: NOT case-sensitive for syntaz and filterng
-- MySQL

SElECT * 
	from employees 
	wHErE geNdeR = "f"
    AND FIRST_NAME = "NEVIN";
    
SELECT * FROM employees; -- readability

-- Men named Bezalel
-- Or just women
SELECT * FROM employees
	WHERE 
		(first_name = "Bezalel"
		AND gender = "M")
	OR gender = "F";

-- Q: MEN named Bezalel or Women born after 1989
SELECT * FROM employees
	WHERE 
		(first_name = "Bezalel"
		AND gender = "M")
	OR gender = "F";
    
-- Men: "Hugo", "Ramzi", "Mark"
SELECT * 
FROM employees
WHERE gender = "M"
AND FIRST_NAME 
	IN ("Hugo", "Ramzi", "Mark");
    
-- Excluding names
SELECT * 
FROM employees
WHERE gender = "M"
AND FIRST_NAME 
	NOT IN ("Hugo", "Ramzi", "Mark");

-- Similiar "Patricia" "Patricio"
SELECT * 
	FROM employees
    WHERE first_name 
    LIKE ("Patrici_"); -- _ one of anything
    
-- Regex: REGEXP 
select * from employees
where gender = "F";
-- where first_name = "Anneke";


-- Names that start with Ann
	-- Anneke, Annemarie, Anneli, etc
    
SELECT * FROM employees
Where gender = "f" 
and first_name LIKE ("ann%"); -- % regex: .*

-- Q: what if I want to literally look for 
-- an underscore: you need to escape the character
-- we do that using:[_] (Uri)

select * from employees;

-- Everyone born in the 60s
SELECT * FROM employees
	WHERE birth_date LIKE ("196%"); -- 1964-06-02

-- Q: can we put between?
SELECT * FROM employees
	WHERE birth_date 
		BETWEEN "1960-01-01" AND "1989-12-31"; -- including (confirmed)

-- input the years "1990", between works with date type
-- it also works with something else

SELECT * FROM employees
WHERE first_name BETWEEN "A" AND "C"; -- between 

-- A-C: A and b (C is not included)

-- All the women hired in the 90s
SELECT * 
	FROM employees
    WHERE hire_date LIKE ("199%")
    AND gender = "F";

-- $145,732

SELECT * FROM salaries
	where salary >= 70000;
    
-- 70-80 range

SELECT * FROM salaries
	WHERE salary BETWEEN 70000 AND 80000; -- Included
    
SELECT * FROM salaries
	WHERE salary BETWEEN 70000 AND 80000
ORDER BY salary;

SELECT * FROM salaries
	WHERE salary BETWEEN  70000 AND 80000
ORDER BY salary ASC; -- default

SELECT * FROM salaries
	WHERE salary BETWEEN 70000 AND 80000
ORDER BY salary DESC;

-- Average salary for this database :( 
SELECT AVG(salary) 
	FROM salaries;
    -- $63,810.74
    
-- Total amount of salaries pasid by the company
SELECT SUM(salary) 
	FROM salaries;
	-- 181480757419
    
-- How many employees?
SELECT COUNT(*) FROM employees; -- 300027
SELECT COUNT(first_name) FROM employees; -- 300027

SELECT COUNT(*) from salaries; -- 2844047

SELECT * FROM salaries
	WHERE salary IS NOT NULL;

SELECT * FROM employees
	WHERE first_name IS  NULL; -- db is ok
    
-- Salaries
-- IRPF (taxes), 15%
-- after_tax
-- gross, after_tax = salary * 0.85
select * from salaries;

SELECT salary AS gross, 
	(salary * 0.85) AS worker_gets,
    (salary * 1.5) AS company_spends
FROM salaries
ORDER BY company_spends DESC; -- asc is the default

-- Table salaries
-- Table employees

SELECT salary AS gross, 
	(salary * 0.85) AS worker_gets,
    (salary * 1.5) AS company_spends
FROM salaries
ORDER BY company_spends DESC;


SELECT first_name, salary, gender 
	FROM salaries
		JOIN employees
			ON	employees.emp_no = salaries.emp_no; 
-- Joining tables
SELECT AVG(salary) as mean_salary, gender 
	FROM salaries
		JOIN employees
			ON	employees.emp_no = salaries.emp_no
	GROUP BY gender;
    
-- MacOS: Settings > Fonts > Font result set 
-- Windows: MENU > EDIT > Preferencias > Font result set 

-- How many different departments
select * from departments;
SELECT COUNT(DISTINCT(dept_name)) FROM departments;

-- How many different names
select COUNT(*) from employees; -- 300 027 emp

select COUNT(distinct(FIRST_NAME)) from employees;  -- 1.277

SELECT COUNT(DISTINCT(CONCAT(FIRST_NAME, " ", LAST_NAME))) 
AS full_name from employees; -- 279 410 emp

-- 10k people share fname + lname

-- Q: TO CHECK
SELECT
	CONCAT(FIRST_NAME, " ", LAST_NAME) as full_name,
	COUNT(DISTINCT(full_name)) AS count
FROM employees
GROUP BY full_name;

-- Difference in average across gender
-- WATCH OUT
	-- When grouping by
    -- We need to get the aggregating thing (sum, count, avg)
    -- As many dimensions as the groupingvariable has: F/M
    -- We cannot have each individual emp_no as well
    
SELECT *, AVG(salary) as mean_salary 
	FROM salaries
		JOIN employees
			ON	employees.emp_no = salaries.emp_no
	GROUP BY gender;
    
-- avg salary: one PER GROUP: two values, two ros
-- emp_no: 56789765 rows
    
-- not in GROUP BY clause and contains nonaggregated column 'employees.salaries.emp_no' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by	0.0011 sec

-- What is the frequency of each name? (first_name)
-- Before: how many UNIQUE
-- Now: how many times qwe have Bezalel, Anneke,..


SELECT first_name, COUNT(first_name) AS the_count
	FROM employees
    GROUP BY first_name
    ORDER BY the_count DESC
    LIMIT 5; -- like head in pandas
    -- I can see the most repeated name

SELECT first_name, last_name, COUNT(CONCAT(first_name, " ", last_name)) AS the_count
	FROM employees
    GROUP BY first_name, last_name
    ORDER BY the_count DESC
    LIMIT 5;
    -- I can see the most repeated name

-- Only those names that are repeated more then 20 times

SELECT first_name, COUNT(first_name) AS the_count
	FROM employees
    GROUP BY first_name
		HAVING the_count > 280
    ORDER BY the_count DESC;
    
-- Filtering AFTER we group


-- WHERE AND HAVING: only the men whose name is repeated more than 280 times in 
-- the whole database
-- the most frequent names for men

SELECT first_name, COUNT(first_name) AS the_count
	FROM employees
		WHERE gender = "M"
    
    GROUP BY first_name
		HAVING the_count > 176
    ORDER BY the_count DESC; -- Make, Giri

-- Now, for women
SELECT first_name, COUNT(first_name) AS the_count
	FROM employees
		WHERE gender = "F"
    
    GROUP BY first_name
		HAVING the_count > 120
    ORDER BY the_count DESC; -- Dipanjar, Tetsushi, Kristin ...