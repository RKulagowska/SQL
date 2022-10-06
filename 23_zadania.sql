-- ZADANIA PODSUMOWUJĄCE DO SZKOLENIA 

-- 1. WYŚWIETL WERSJĘ SQLITE 

SELECT sqlite_version();

-- 2. WYŚWIETL AKTUALNY CZAS, DATE, DATĘ I CZAS

SELECT time();
SELECT CURRENT_TIME;
SELECT CURRENT_DATE;
SELECT CURRENT_TIMESTAMP;

-- 3. WYŚWIETL WYNIK Z DZIELENIA 23 PRZEZ 4

SELECT 23/4.0;

-- 4. WYŚWIETL CAŁĄ TABELE EMPLOYEE (BAZA Northwind) 

SELECT * FROM Employee;

-- 5. WYŚWIETL CAŁĄ TABELE ORDER

SELECT * FROM 'Order';
SELECT * FROM "Order";
SELECT * FROM [Order];

-- 6. WYŚWIETL FirstName, LastName,Country, City Z TABELI Employee W PODANEJ KOLEJNOŚCI 

SELECT FirstName, 
		LastName,
		Country, 
		City 
FROM Employee;

-- 7. WYŚWIETL CAŁĄ TABELE CUSTOMER  (ZWRÓĆ UWAGĘ NA KOLUMNĘ Id)

SELECT * FROM Customer;

-- 8. WYŚWIETL CAŁĄ TABELE CUSTOMER RAZEM Z KOLUMNĄ ROWID UMIESZCZONĄ JAKO PIERWSZĄ 

SELECT ROWID,* FROM Customer;

SELECT ROWID, Address,* FROM Customer;

-- 9. Wyświetl kolumny: ProductName, UnitPrice z tabeli Product w podanej kolejności i posortuj rosnąco po kolumnie UnitPrice.

SELECT ProductName,UnitPrice
FROM Product
ORDER BY UnitPrice;

SELECT ProductName,UnitPrice
FROM Product
ORDER BY 2;

-- 10. Wyświetl kolumny:ProductName, UnitPrice z tabeli Product w podanej kolejności i posortuj malejąco po kolumnie UnitPrice.

SELECT ProductName,UnitPrice
FROM Product
ORDER BY UnitPrice DESC;

SELECT ProductName,UnitPrice
FROM Product
ORDER BY 2 DESC;

-- 11. Wyświetl kolumny CompanyName, Country, City z tabeli Customer w podanej powyżej kolejności. 
-- Tabelę wynikową posortuj rosnąco po kolumnie Country i następnie rosnąco po kolumnie City.

SELECT CompanyName, Country, City
FROM Customer
ORDER BY country, City;

-- 12. Wyświetl kolumny CompanyName, Country, City z tabeli Customer w podanej powyżej kolejności. 
-- Tabelę wynikową posortuj rosnąco po kolumnie Country i następnie malejąco po kolumnie City.

SELECT CompanyName, Country, City
FROM Customer
ORDER BY country,City DESC;

SELECT CompanyName, Country, City
FROM Customer
ORDER BY 2,3 DESC;

-- 13. Wyświetl tabelę Order posortowaną po kolumnie ShippedDate rosnąco.
-- Zwróć uwagę na braki danych (NULL).

SELECT * FROM "Order" ORDER BY ShippedDate;

-- 14. Wyświetl tabelę Order posortowaną po kolumnie ShippedDate rosnąco.
-- Braki danych (NULL) pozostaw na końcu sortowania.

SELECT * FROM "Order" ORDER BY ShippedDate NULLS LAST;

-- 15. Wyświetl tabelę Order posortowaną po kolumnie ShippedDate malejąco.
-- Zwróć uwagę na braki danych (NULL).

SELECT * FROM "Order" ORDER BY ShippedDate DESC;

-- 16. Wyświetl tabelę Order posortowaną po kolumnie ShippedDate malejąco.
-- Braki danych (NULL) pozostaw na początku sortowania.

SELECT * FROM "Order" ORDER BY ShippedDate DESC NULLS FIRST;

-- 17. Wyświetl 5 wierszy z tabeli Supplier.

SELECT * 
FROM Supplier
LIMIT 5;

-- 18. Wyświetl 5 najtańszych produktów (UnitPrice) z tabeli Product.

SELECT * FROM Product
ORDER BY UnitPrice
LIMIT 5; 

-- 19. Wyświetl 10 najdroższych produktów (UnitPrice) z tabeli Product.

SELECT * FROM Product
ORDER BY UnitPrice DESC
LIMIT 5; 

-- 20. Wyświetl (tylko) nazwy 10 najdroższych produktów (UnitPrice) z tabeli Product.

SELECT ProductName FROM Product
ORDER BY UnitPrice DESC
LIMIT 10; 

