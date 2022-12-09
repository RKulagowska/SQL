/*
Podane jest poniższe zapytanie:
SELECT department_id 
FROM employee 
WHERE salary > 10000;
Zapytanie zwraca wartości dla department_id, dla których wynagrodzenie jest wyższe niż 10000.
Wykorzystując rezultat tego zapytania jako podzapytanie wyświetl nazwy wszystkich departamentów 
dla których spełniony jest powyższy warunek.
*/

SELECT department_name
FROM department
WHERE department_id IN
				(SELECT department_id 
				FROM employee 
				WHERE salary > 10000);

/*
Utwórz zapytanie, które zwróci wartości dla kolumny job_id z tabeli employee, gdzie wynagrodzenie 
jest wyższe niż 10000.
Wykorzystując rezultat poprzedniego zapytania jako podzapytanie wyświetl nazwy wszystkich 
stanowisk dla których spełniony jest powyższy warunek.
*/

SELECT job_title
FROM job
WHERE job_id IN 
			(SELECT job_id
			FROM employee
			WHERE salary >10000);

/*
Podane jest poniższe zapytanie:

SELECT product_id,
       COUNT(*) AS number_of_orders
FROM sale
GROUP BY product_id;

Przekształć zapytanie tak, aby wyświetlić tylko trzy pierwsze wartości dla kolumny product_id 
z najwyższą wartością dla kolumny number_of_orders.
*/
SELECT product_id
FROM(
	SELECT product_id,
       COUNT(*) AS number_of_orders
	FROM sale
	GROUP BY product_id
	ORDER BY number_of_orders DESC
	LIMIT 3);

/*
Podane jest poniższe zapytanie:

SELECT product_id
FROM sale
GROUP BY product_id
ORDER BY COUNT(*) DESC
LIMIT 3;

Wykorzystaj podane zapytanie tak, aby wyświetlić wszystkie informacje z tabeli product na temat
produktów, które zwracane są poprzez powyższe zapytanie.
*/

SELECT *
FROM product
WHERE product_id IN
    (SELECT product_id
     FROM
       (SELECT product_id,
               COUNT(product_id)
        FROM sale
        GROUP BY product_id
        ORDER BY COUNT(product_id) DESC
        LIMIT 3));

/*
Pogrupuj dane z tabeli sale na poziomie product_id. Wyznacz liczbę zamówień dla każdego 
produktu i przypisz alias number_of_orders. Wykorzystując klauzulę HAVING wyświetl tylko te 
produkty, które pojawiły się tylko raz w tabeli (jedno zamówienie).
*/

SELECT product_id,
       COUNT(*) AS number_of_orders
FROM sale
GROUP BY product_id
HAVING COUNT(*) == 1;

/*
Wykorzystując poprzednie ćwiczenie oraz podzapytania zbuduj zapytanie, które pozwoli wyświetlić
wszystkie informacje na temat produktów z tabeli product, które zostały zakupione tylko raz 
(tabela sale).
*/

SELECT * 
FROM product
WHERE product_id IN 
				(SELECT product_id,
						COUNT(*) AS number_of_orders
				FROM sale
				GROUP BY product_id
				HAVING COUNT(*) == 1);
				




		

