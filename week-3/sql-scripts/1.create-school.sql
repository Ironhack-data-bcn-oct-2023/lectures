-- 1. TABLES: teacher, course, client, participant, takes_course
-- 2. COLUMNS: 
-- 3. RELATIONSHIPS: 

-- 1. Create the database
DROP DATABASE IF EXISTS SCHOOL;
CREATE DATABASE IF NOT EXISTS school;
USE school;

-- UPPERCASE DOESN'T MATTER: not case-sensitive
-- INDENTATION DOESN'T MATTER

-- 1. TABLES
-- 1.1. Teacher

CREATE TABLE IF NOT EXISTS teacher (
	teacher_id INT PRIMARY KEY, -- it's a number, cannot be null
    first_name VARCHAR(40) NOT NULL,
    language_1 CHAR(3), 
    language_2 CHAR(3), -- SPA
    dob DATE,
    tax_id INT UNIQUE NOT NULL, -- AK
    phone_no VARCHAR(40)
);

-- Don't have at least one column that is NOT NULL, -> whole record doens't go insert
-- Why would we want to not have EVERYTHING not null? 
	-- We know people
    -- We could only have one language
    -- Phone number may be optional?
    -- Related to other tables: we'l keep
CREATE TABLE IF NOT EXISTS client (
	-- client is a SQL keyword
    -- client.client_id PK
    client_id INT PRIMARY KEY, -- PK,  Unique, not nulls?
    client_name VARCHAR(40) NOT NULL,
    address VARCHAR(40),
    industry VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS participant (
	participant_id INT PRIMARY KEY, 
    first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40),
    phone_no VARCHAR(40),
    client INT 
	-- client.client_id -> participant.client
    -- PK               ->        FK
);

-- course

CREATE TABLE IF NOT EXISTS course (
	course_id INT PRIMARY KEY,
    course_name VARCHAR(40) NOT NULL,
    language CHAR(3), -- code 
    level CHAR(2), -- B2, C1, C2...
				  -- qualintative
				-- ordinal: 1, 2, 3
    course_length_weeks INT, 
    start_date DATE,
    in_school BOOLEAN,
    teacher INT, -- FK references PK teacher.teacher_id
    client INT
);
-- teacher and client are not YET relationed

-- 2. ALTER TABLES: establish relationships
ALTER TABLE participant
	ADD FOREIGN KEY (client) -- name of col in part
REFERENCES client(client_id) 
ON DELETE SET NULL;

ALTER TABLE course
	ADD FOREIGN KEY (teacher)
REFERENCES teacher(teacher_id) -- 003 is deleted parent table
ON DELETE CASCADE; -- also deleted on course table


CREATE TABLE takes_course (
	participant_id INT,
    course_id INT,
    PRIMARY KEY (participant_id, course_id),
		FOREIGN KEY (participant_id) REFERENCES participant(participant_id) ON DELETE CASCADE,
		FOREIGN KEY (course_id) REFERENCES course(course_id) ON DELETE CASCADE);
 

-- You wont have to insert the values that are set to AI: autoincrement. Will be unique
-- set to null / delete

    
-- 4. POPULATE

INSERT INTO teacher (teacher_id, first_name, language_1, language_2, tax_id)
VALUES (1, "Mica", "ESP", "ENG", "9876543");


INSERT INTO teacher 
VALUES (2, "Marcel", "ESP", "CAT", "1990-01-01", "9876544", "666666666");

INSERT INTO teacher VALUES 
(3, "Alfons", "ESP", "CAT", NULL ,"9876545", "666666666"),
(4, "Alfons", "ESP", "CAT", NULL ,"9876546", "666666666"),
(5, "Paul", "ESP", "CAT", NULL ,"9876547", "666666666");

-- UPDATE
-- alfons in row 4 -> something else Hugo
UPDATE teacher
SET first_name = "Hugo"
WHERE teacher_id = 4;

select * from teacher;

DELETE FROM teacher WHERE   teacher_id = 1; -- gone, WHERE IS CRUCIAL
select * from teacher;
