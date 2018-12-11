# Задание 1

CREATE DATABASE IF NOT EXISTS company;

USE company;

CREATE TABLE IF NOT EXISTS employees (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
    post_id INT NOT NULL
);

CREATE TABLE IF NOT EXISTS positions (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key,
	post VARCHAR(30)  NOT NULL,
    salary INT NOT NULL
);

INSERT INTO employees (id, first_name, last_name, post_id) VALUES (null, 'Igor', 'Voronov', 1);
INSERT INTO employees (id, first_name, last_name, post_id) VALUES (null, 'Nikolai', 'Ivanov', 2);
INSERT INTO employees (id, first_name, last_name, post_id) VALUES (null, 'Oleg', 'Petrov', 3);
INSERT INTO employees (id, first_name, last_name, post_id) VALUES (null, 'Anna', 'Mironova', 4);
INSERT INTO employees (id, first_name, last_name, post_id) VALUES (null, 'Pavel', 'Serov', 5);
INSERT INTO employees (id, first_name, last_name, post_id) VALUES (null, 'Svetlana', 'Sidorova', 5);

INSERT INTO positions (id, post, salary) VALUES (null, 'Technical Director', 100000);
INSERT INTO positions (id, post, salary) VALUES (null, 'Junior Developer', 35000);
INSERT INTO positions (id, post, salary) VALUES (null, 'Senior Developer', 65000);
INSERT INTO positions (id, post, salary) VALUES (null, 'SMM Manager', 25000);
INSERT INTO positions (id, post, salary) VALUES (null, 'Technical Support Specialist', 20000);

# Задание 2

SELECT empl.first_name, empl.last_name, pos.salary
FROM employees empl
INNER JOIN positions pos ON empl.post_id = pos.id
WHERE pos.salary < 30000;

SELECT empl.first_name, empl.last_name, pos.salary
FROM employees empl
INNER JOIN positions pos ON empl.post_id = pos.id
WHERE pos.post = 'Technical Support Specialist' AND pos.salary < 30000;

# Задание 3

CREATE TABLE IF NOT EXISTS subordination (
	subordinate_id INT,
    chief_id INT
);

INSERT INTO subordination (subordinate_id, chief_id) VALUES (1, null);
INSERT INTO subordination (subordinate_id, chief_id) VALUES (2, 1);
INSERT INTO subordination (subordinate_id, chief_id) VALUES (2, 3);
INSERT INTO subordination (subordinate_id, chief_id) VALUES (3, 1);
INSERT INTO subordination (subordinate_id, chief_id) VALUES (4, 1);
INSERT INTO subordination (subordinate_id, chief_id) VALUES (5, 1);

SELECT CONCAT(emplch.first_name, " ", emplch.last_name) AS chief, CONCAT(empls.first_name, " ", empls.last_name) AS subordinate 
FROM subordination sub
INNER JOIN employees emplch
    ON sub.chief_id = emplch.post_id
INNER JOIN employees empls
    ON sub.subordinate_id = empls.post_id
WHERE emplch.post_id = 1
;

SELECT CONCAT(emplch.first_name, " ", emplch.last_name) AS chief, CONCAT(empls.first_name, " ", empls.last_name) AS subordinate 
FROM subordination sub
INNER JOIN employees emplch
    ON sub.chief_id = emplch.post_id
INNER JOIN employees empls
    ON sub.subordinate_id = empls.post_id
WHERE emplch.post_id = 3
;




