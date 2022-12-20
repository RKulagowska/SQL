/*
zadania SQL 
*/

DROP TABLE IF EXISTS 'esmartdata_instructor';

CREATE TABLE esmartdata_instructor(
    id    INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	first_name TEXT NOT NULL,
    last_name  TEXT NOT NULL,
    description TEXT NOT NULL
    );
	
DROP TABLE IF EXISTS 'esmartdata_course';

CREATE TABLE esmartdata_course(
    id    INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title TEXT NOT NULL,
    subtitle  TEXT NOT NULL,
    description TEXT NOT NULL,
	category TEXT NOT NULL,
    subcategory  TEXT NOT NULL,
    language TEXT NOT NULL,
	lenght TEXT NOT NULL,
	rating REAL NOT NULL,
    referral_link  TEXT NOT NULL,
    instructor_id INTEGER NOT NULL,
	FOREIGN KEY ('instructor_id')REFERENCES 'esmartdata_instructor'('id')
    );
	
INSERT INTO 'esmartdata_instructor' VALUES
					(1,"Paweł", "Krakowiak", "Data Scientist/Python Developer/Securities Broker"),	
					(2, "takeITeasy", "Academy", "Akademia Programowania");

SELECT * FROM esmartdata_instructor; 	

/* 
Utwórz połączenie typu LEFT JOIN tabel:
•	department
•	location
wykorzystując kolumnę location_id. W tabeli wynikowej wyświetl kolumny:
•	department_id
•	department_name
•	street_address
•	city
* / 
SELECT d.department_id,
        d.department_name,
        l.street_address,
        l.city
FROM department AS d
LEFT JOIN location  AS l ON d.location_id == l.location_id; 

/* 
Utwórz połączenie typu LEFT JOIN (w podanej kolejności) tabel:
•	department
•	location
•	country
wykorzystując kolumnę location_id oraz country_id odpowiednio. W tabeli wynikowej wyświetl wszystkie kolumny.
W tabeli wynikowej wyświetl kolumny:
•	department_id
•	department_name
•	street_address
•	city
•	country_name
*/

SELECT d.department_id,
        d.department_name,
        l.street_address,
        l.city,
        c.country_name
FROM department AS d
LEFT JOIN location  AS l ON d.location_id == l.location_id
LEFT JOIN country AS C on c.country_id == l.country_id;

/* 
Podane jest poniższe zapytanie:

	SELECT t1.employee_id,
	       t1.email,
	       t1.salary,
	       t2.job_title,
	       t3.department_name
	FROM employee AS t1
	LEFT JOIN job AS t2 ON t1.job_id = t2.job_id
	LEFT JOIN department AS t3 ON t1.department_id = t3.department_id;

Przekształć podane zapytanie. Pogrupuj dane na poziomie department_name i wyznacz liczbę pracowników dla każdego departamentu przypisując alias number_of_employees. Wynik posortuj po malejącej wartości number_of_employees.
Tabela wynikowa ma zawierać dwie kolumny:
•	department_name
•	number_of_employees
*/

SELECT t3.department_name,
       COUNT(*) AS number_of_employees
FROM employee AS t1
LEFT JOIN job AS t2 ON t1.job_id = t2.job_id
LEFT JOIN department AS t3 ON t1.department_id = t3.department_id
GROUP BY t3.department_name
ORDER BY number_of_employees DESC;

/* 
Podane jest poniższe zapytanie:

	SELECT t1.quantity,
	       t2.list_price,
	       t1.quantity * t2.list_price AS total_price
	FROM order_01_2021 AS t1
	INNER JOIN product AS t2 ON t1.product_id = t2.product_id;

Zmodyfikuj zapytanie tak, aby wyznaczyć łączną wartość sprzedaży za styczeń i przypisz alias total_sales.
*/

SELECT sum(t1.quantity * t2.list_price)AS total_sales
FROM order_01_2021 AS t1
INNER JOIN product AS t2 ON t1.product_id = t2.product_id;


    
	
