-- 1. Wyświetl tabele Order oraz Customer. Zwróć uwagę na kolumnę CustomerId w tabeli
-- Order oraz kolumnę Id w tabeli Customer.
SELECT * FROM "Order";
SELECT * FROM Customer;

/*
2. Wykonaj połączenie typu LEFT JOIN tabel Order oraz Customer łącząc je po kolumnach:
CustomerId z tabeli Order oraz Id z tabeli Customer. 
W wyniku wyświetl kolumny:
     * CustomerId z tabeli Order
     * Id z tabeli Customer
     * Freight
     * CompanyName
     * ContactName
*/

SELECT t1.CustomerId,
	   t2.Id,
	   t1.Freight,
	   t2.CompanyName,
	   t2.ContactName
FROM 'Order' AS t1
LEFT JOIN Customer AS t2 ON  t1.CustomerId == t2.Id;

-- 3. Do zapytania z poprzedniego ćwiczenia dodaj warunek WHERE, który wyświetli wiersze
-- gdzie kolumna Id w tabeli Customer przyjmuje wartości NULL.

SELECT t1.CustomerId,
	   t2.Id,
	   t1.Freight,
	   t2.CompanyName,
	   t2.ContactName
FROM 'Order' AS t1
LEFT JOIN Customer AS t2 ON  t1.CustomerId == t2.Id
WHERE t2.Id IS Null;
/*
4. Poniższe zapytanie przekształć na połączenie typu INNER JOIN
SELECT t1.CustomerId,
       t2.Id,
       t1.Freight,
       t2.CompanyName,
       t2.ContactName
FROM "Order" AS t1
LEFT JOIN Customer AS t2 ON t1.CustomerId = t2.Id;
-- INNER JOIN
*/

SELECT t1.CustomerId,
       t2.Id,
       t1.Freight,
       t2.CompanyName,
       t2.ContactName
FROM "Order" AS t1
INNER JOIN Customer AS t2 ON t1.CustomerId == t2.Id;