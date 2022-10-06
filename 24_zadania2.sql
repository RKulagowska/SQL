-- 1. Pomiń 3 najtańsze produkty w tabeli Product i wyświetl kolejne 5 najtańszych 
-- produktów (UnitPrice) z tabeli Product.

SELECT * 
FROM Product
ORDER BY UnitPrice 
LIMIT 5 OFFSET 3;

-- 2. Wyświetl jedenasty najdroższy produkt z tabeli Product.

SELECT * 
FROM Product
ORDER BY UnitPrice DESC
LIMIT 1 OFFSET 10;

-- 3. Wyświetl kolumny Country oraz City z tabeli Customer.

SELECT Country, City 
FROM Customer;

-- 4. Wyświetl unikalne nazwy krajów występujące w kolumnie Country tabeli Customer.

SELECT DISTINCT Country
FROM Customer;

-- 5. Wyświetl unikalne nazwy krajów występujące w kolumnie Country tabeli Customer. 
-- Posortuj wyniki rosnąco.

SELECT DISTINCT Country
FROM Customer
ORDER BY Country;

-- 6. Wyświetl unikalne nazwy miast występujące w kolumnie City tabeli Customer.

SELECT DISTINCT City
FROM Customer;


-- 7. Wyświetl unikalne pary kraj <-> miasto występujące w kolumnach Country oraz City 
-- tabeli Customer.

SELECT DISTINCT Country, City
FROM Customer;

-- 8. Wyświetl unikalne nazwy regionów występujące w kolumnie Region tabeli Supplier.

SELECT DISTINCT Region
FROM Supplier;