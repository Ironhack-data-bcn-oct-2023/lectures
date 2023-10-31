
-- IMPORTANT: Having and where
	-- Where filters before grouping
    -- Having filters after grouping
    
-- Join: salaries and the gender
-- What is the average salary 
-- paid in each deparment

-- 1. Columns to select
	-- salary
    -- department_name
-- 2. Tables
	-- salaries
    -- employess
    -- dept_manager
    -- departments
-- 3. KEYS that are shared between these tables
	-- salaries.emp_no
    -- employees.emp_no
    -- dept_manager.emp_no
    -- departments.dept_no
    
-- 4. How we want the info: aggreated?...
	-- avg: salary
    -- group by: dept_name
-- 5. Order by, limit, ....
	-- ORDER BY: salary DESC;

USE employees;
SELECT AVG(salary) AS average_salary, dept_name
	FROM salaries
		JOIN employees
			ON salaries.emp_no = employees.emp_no
		JOIN dept_manager
			ON employees.emp_no = dept_manager.emp_no
		JOIN departments
			ON dept_manager.dept_no = departments.dept_no
	GROUP BY dept_name
    ORDER BY average_salary DESC; -- 🤞🤞🤞


-- 1. Columns: title & au_lname
-- 2. Tables: titles, titleauthor, authors
-- 3. How? we don't care

-- https://stackoverflow.com/questions/4796872/how-can-i-do-a-full-outer-join-in-mysql
-- UNION
USE publications;
SELECT title, au_lname
	FROM titles
		JOIN titleauthor
			ON titles.title_id = titleauthor.title_id
        JOIN authors
			ON titleauthor.au_id = authors.au_id; -- 🤞🤞🤞
            
-- How many copies each author sold
-- EER diagram: ctrl + R / cmmd + R
SELECT SUM(qty) AS total, au_lname
	FROM sales
		JOIN titles
			ON sales.title_id = titles.title_id
		JOIN titleauthor
			ON titles.title_id = titleauthor.title_id
        JOIN authors
			ON titleauthor.au_id = authors.au_id
	GROUP BY au_lname
    ORDER BY total DESC;
            
            -- 🤞🤞🤞

-- Best selling store
SELECT SUM(qty) AS total, stor_name
	FROM stores
		JOIN sales
			ON stores.stor_id = sales.stor_id
		
	GROUP BY stor_name
    ORDER BY total DESC;


-- How many copies sold per author only in California
SELECT SUM(qty) AS total, au_lname
	FROM stores
		JOIN sales
			ON stores.stor_id = sales.stor_id
		JOIN titles
			ON sales.title_id = titles.title_id
		JOIN titleauthor
			ON titles.title_id = titleauthor.title_id
        JOIN authors
			ON titleauthor.au_id = authors.au_id
	WHERE stores.state = "CA"
	GROUP BY au_lname
    ORDER BY total DESC;
    
-- Authors and their state selling copies only in California: 
SELECT SUM(qty) AS total, au_lname, authors.state
	FROM stores
		JOIN sales
			ON stores.stor_id = sales.stor_id
		JOIN titles
			ON sales.title_id = titles.title_id
		JOIN titleauthor
			ON titles.title_id = titleauthor.title_id
        JOIN authors
			ON titleauthor.au_id = authors.au_id
	WHERE stores.state = "CA"
	GROUP BY au_lname, state
    ORDER BY total DESC;            
-- 1052. Column 'state' in where clause is ambiguous	0.00034 sec


