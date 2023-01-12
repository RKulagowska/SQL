-- połacz 2 tabele i wyciągnij średnią z Number w City_name 

DROP TABLE IF EXISTS CITY;
DROP TABLE IF EXISTS REVENUE;

CREATE TABLE CITY (
		Code      INTEGER NOT NULL,
		City_name      TEXT NOT NULL
);
CREATE TABLE REVENUE (
		Code     INTEGER NOT NULL,
		Number       Integer NOT NULL
);

INSERT INTO CITIES (Code, City_name )
VALUES (1,'Warszawa'),
		(2, 'Toruń'),
		(3,'Paris');

INSERT INTO REVENUE(Code,Number)
VALUES (1,100),
		(2,50),	
		(2,100),
		(3,150);	
		
SELECT * from CITIES;
SELECT * from REVENUE;

SELECT t2.City_name,
	   AVG(Revenue)
FROM REVENUE AS t1
LEFT JOIN CITIES  AS t2 ON t1.City_code = t2.City_code
GROUP BY City_name;

-- Tylko parzyste numery ID

SELECT * 
FROM 'ORDER'
WHERE id%2=0; 

-- Róznica między wszystkimi zamówieniami a liczbą unikalnych dni zamówień 

SELECT COUNT(OrderDate) - COUNT(DISTINCT OrderDate) AS Difference
FROM 'Order';

-- Znajdź najkrótsze (najmniej znaków) ShipCountry i najdłuższe z odpowiadającymi im ilościami znaków 

SELECT ShipCountry, LENGTH(ShipCountry)
FROM 'Order'
ORDER BY LENGTH(ShipCountry), ShipCountry
LIMIT 1; 
SELECT ShipCountry, LENGTH(ShipCountry)
FROM 'Order'
ORDER BY LENGTH(ShipCountry) DESC, ShipCountry DESC
LIMIT 1;

-- wszystkie unikalne ShipCountry zaczynające się na (A,E,I,O LUB U)
SELECT DISTINCT(ShipCountry)
FROM 'ORDER'
WHERE ShipCountry LIKE 'A%' OR ShipCountry LIKE 'E%' OR ShipCountry LIKE 'I%' OR ShipCountry LIKE 'O%' OR ShipCountry LIKE 'U%';

SELECT DISTINCT(ShipCountry)
FROM 'ORDER'
WHERE ShipCountry REGEXP'^[A,E,I,O,U]';

--wszystkie zakończone na (A,E,I,O LUB U)
SELECT DISTINCT(ShipCountry)
FROM 'ORDER'
WHERE ShipCountry LIKE '%a' OR ShipCountry LIKE '%e' OR ShipCountry LIKE '%i' OR ShipCountry LIKE '%o' OR ShipCountry LIKE '%u';

SELECT DISTINCT ShipCountry 
FROM 'ORDER'
WHERE SUBSTR(ShipCountry,LENGTH(ShipCountry),1) IN ('a','e','i','o','u');

--wszystkie zakończone na (A,E,I,O LUB U) lub zaczynające się od tych liter 

SELECT DISTINCT ShipCountry
FROM 'ORDER' 
WHERE ShipCountry REGEXP'^[A,E,I,O,U].*[a,e,i,o,u]$';

-- NIE KOŃCZY SIĘ NA  (A,E,I,O LUB U)
SELECT DISTINCT(ShipCountry)
FROM 'ORDER'
WHERE ShipCountry NOT LIKE '%a' AND ShipCountry NOT LIKE '%e' AND ShipCountry NOT LIKE '%i' AND ShipCountry NOT LIKE '%o' AND ShipCountry NOT LIKE '%u';

-- x wszystkie nie zakończone na (A,E,I,O LUB U) i nie zaczynające się od tych liter 
SELECT DISTINCT ShipCountry
FROM 'ORDER' 
WHERE NOT (ShipCountry REGEXP'^[A,E,I,O,U]|[a,e,i,o,u]$');

-- JAK BYŁABY RÓŻNICA MIĘDZY ŚREDNIĄ W QUANTITY W TABELI ORDERDETAI A ŚREDNIĄ Z TEJ SAMEJ TABELI
-- JEŚLI WYTNIEMY WSZTSTKIE 0 

SELECT AVG(QUANTITY)- AVG(REPLACE(QUANTITY,0,''))
FROM OrderDetail;

-- z tabeli OrderDetail wybierz największą wartość UnitPrice pomnożone przez quantity.
-- zwróć wartość i ilość największych wartości 


SELECT UnitPrice * Quantity, COUNT(UnitPrice * Quantity)
FROM OrderDetail
GROUP BY UnitPrice * Quantity 
ORDER BY UnitPrice * Quantity DESC 
LIMIT 1;

-- POŁĄCZ 3 PIERWSZE ZNAKI Z ProductName Z SupplierId UMIESZCZONYM W NAWIASCH Z TABELI PRODUCT 
-- POŁACZ STR 'THERE ARE A TOTAL OF' Z LICZBĄ PRODUKTÓW Z DYSKONTEM ZAKOŃCZ 'PRODUCT WITH DISCOUNT.'

SELECT substr(ProductName,1,3) || ' ('|| SupplierId || ')'
FROM Product
ORDER BY ProductName;

SELECT 'THERE ARE A TOTAL OF '|| COUNT(Discontinued) || ' PRODUCT WITH DISCOUNT.'
FROM Product

-- POKAŻ DISCOUNT Z ZAOKRĄGLENIEM DO PIERWSZEGO MIEJSCA PO PRZECINKU 

SELECT ROUND(DISCOUNT,1) 
FROM OrderDetail;

--POKAŻ ZAMIAST UnitPrice, AVG(UnitPrice) - obliczonego dla SupplierId  - użycie over 

SELECT ProductName,
		SupplierId,
		Avg(unitPrice) over ()
FROM Product

--PONUMERUJ PRODUKTY PO SupplierId
SELECT ProductName,
		SupplierId,
		row_number() OVER(PARTITION BY SupplierId)
FROM Product;

-- POKAŻ ProductName, ProductId iponumeruj produkty 

SELECT ProductName,
		SupplierId,
		row_number() OVER(order By SupplierId)
FROM Product;

--PONUMERUJ PRODUKTY PO SupplierId i wysokośći ceny 
SELECT ProductName,
		SupplierId,
		UnitPrice,
		row_number() OVER(PARTITION BY SupplierId order by UnitPrice)
FROM Product;

-- pokaż 2 największe UnitPrice dla każdego SupplierId
SELECT ProductName,
		SupplierId,
		UnitPrice
FROM (
SELECT ProductName,
		SupplierId,
		UnitPrice,
		rank() over (PARTITION BY SupplierId order by UnitPrice desc) as BEST
FROM Product) AS NEW
WHERE BEST < 3;


-- POKAŻ medianę unit price
SELECT CAST(UnitPrice AS DECIMAL(10,2))
FROM
(
SELECT UnitPrice,
		row_number() OVER(ORDER BY UnitPrice) AS RN,
		COUNT(UnitPrice) over() as CNT
from Product
)
WHERE RN = (CNT+1)/2;

--Zapoznaj się z tabelami:order_01_2021, order_02_2021. Tabele przechowują zamówienia dla dwóch kolejnych miesięcy. Połącz te tabele w jedną wykorzystując 
--operator UNION. W tabeli wynikowej wyświetl wszystkie kolumny przekazując ich nazwy bezpośrednio w zapytaniu. Posortuj wynik po malejącej wartości dla kolumny quantity.

SELECT order_id,
	product_id,
	quantity 
FROM order_01_2021
UNION
SELECT order_id,
	product_id,
	quantity
FROM order_02_2021
ORDER BY quantity DESC;

-- Podane jest poniższe zapytanie:
-- SELECT t1.order_id,
--       t1.quantity,
--       t2.product_name,
--       t2.list_price
--FROM order_01_2021 AS t1
--LEFT JOIN product AS t2 ON t1.product_id = t2.product_id;

--Wykorzystując operator UNION utwórz zapytanie, które wyświetli unikalne nazwy produktów sprzedanych w styczniu i w lutym (tabele order_01_2021 oraz order_01_2021).

SELECT t2.product_name
FROM order_01_2021 AS t1
LEFT JOIN product AS t2 ON t1.product_id = t2.product_id
UNION
SELECT t2.product_name
FROM order_02_2021 AS t1
LEFT JOIN product AS t2 ON t1.product_id = t2.product_id;

--Podane jest poniższe zapytanie:
-- SELECT t1.quantity,
--       t2.product_name,
--      t2.list_price,
--      t1.quantity * t2.list_price AS total_price
--FROM order_01_2021 AS t1
--LEFT JOIN product AS t2 ON t1.product_id = t2.product_id
--UNION ALL
--SELECT t1.quantity,
--       t2.product_name,
--       t2.list_price,
--       t1.quantity * t2.list_price AS total_price
--FROM order_02_2021 AS t1
--LEFT JOIN product AS t2 ON t1.product_id = t2.product_id;

--Wykorzystując podane zapytanie posortuj tabelę wynikową po malejącej wartości dla kolumny total_price i ogranicz wynik do pięciu pierwszych rekordów.

SELECT * FROM(
SELECT t1.quantity,
       t2.product_name,
       t2.list_price,
       t1.quantity * t2.list_price AS total_price
FROM order_01_2021 AS t1
LEFT JOIN product AS t2 ON t1.product_id = t2.product_id
UNION ALL
SELECT t1.quantity,
       t2.product_name,
       t2.list_price,
       t1.quantity * t2.list_price AS total_price
FROM order_02_2021 AS t1
LEFT JOIN product AS t2 ON t1.product_id = t2.product_id)
ORDER BY total_price DESC 
LIMIT 5;


--Utwórz zapytanie, które wyświetli liczbę unikalnych gatunków filmowych zawartych w tabeli movie_genres. Wykorzystaj w tym celu kolumnę genre_id.
--Do wyniku przypisz alias unique_genres.

SELECT COUNT(DISTINCT genre_id) AS unique_genres
FROM movie_genres;

/*
Utwórz zapytanie, które wyświetli liczbę gatunków filmowych dla każdego filmu. W tym celu pogrupuj dane z tabeli movie_genres na poziomie movie_id 
i wyznacz liczbę gatunków dla każdego filmu przypisując alias number_of_genres. Wynik posortuj po malejącej wartości number_of_genres.
*/

SELECT movie_id,
      count(movie_id) AS number_of_genres
FROM movie_genres
GROUP BY movie_id
ORDER BY number_of_genres DESC;


/* 
Podane jest poniższe zapytanie:
SELECT t1.movie_id,
       t2.genre_name       
FROM movie_genres AS t1
LEFT JOIN genre AS t2 ON t1.genre_id = t2.genre_id;
Przekształć podane zapytanie tak, aby wyświetlić tylko nazwy trzech najczęściej występujących kategorii filmowych w tabeli movie_genres.
*/

SELECT t2.genre_name       
FROM movie_genres AS t1
LEFT JOIN genre AS t2 ON t1.genre_id = t2.genre_id
GROUP BY t2.genre_name
ORDER BY count(t2.genre_name) DESC
LIMIT 3;




