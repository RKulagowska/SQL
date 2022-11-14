DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS employee;

CREATE TABLE department(	
		id 				INTEGER PRIMARY KEY,
		dept_name 		TEXT NOT NULL,
		dept_code 		TEXT NOT NULL	
);

CREATE TABLE employee(	
		id 				INTEGER PRIMARY KEY,
		first_name 		TEXT NOT NULL,
		last_name 		TEXT NOT NULL,
		hire_date		TEXT,
		department_Id INTEGER NOT NULL REFERENCES department(id)
);

INSERT INTO department (dept_name,dept_code)
VALUES ('Information Technology','IT'),
		('Seles','SLS'),
		('Human Resource', 'HR');
		
SELECT * FROM department;

INSERT INTO employee(first_name,last_name,hire_date,department_id)
VALUES ('John','Smith','1996-05-05',1),
		('Jan','Kowalski','2000-06-05',2),
		('Monika','Bys','2002-07-07',3);

SELECT * FROM employee;	

-- department_Id może się powtarzać 1:N

INSERT INTO employee(first_name,last_name,hire_date,department_id)
VALUES ('John','X','1998-05-05',1);
SELECT * FROM employee;

-- nie pozwoli wprowadzić w department_Id wartości nie występującej w tabeli nadrzędnej 
--Wynik: FOREIGN KEY constraint failed

INSERT INTO employee(first_name,last_name,hire_date,department_id)
VALUES ('John','X','1998-05-05',10);

