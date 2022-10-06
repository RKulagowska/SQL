-- 1. Wyświetl liczbę niepustych rekordów w tabeli Order.

SELECT Count(*) 
FROM 'Order';

-- 2. Wyświetl liczbę niepustych rekordów w tabeli Order. Przypisz podany alias do
-- kolumny wynikowej: NumberOfRows

SELECT Count(*) AS NumberOfRows
FROM 'Order';

-- 3. Wyznacz liczbę unikalnych klientów (kolumna CustomerId) w tabeli Order i przypisz
-- podany alias: NumberOfCustomers

SELECT Count(Distinct CustomerId) AS NumberOfCustomers
FROM 'Order';

/*
4. Wyznacz dwie wartości:
     * liczbę niepustych wartości dla kolumny CustomerId w tabeli Order
    * liczbę unikalnych klientów (kolumna CustomerId) w tabeli Order
 i przypisz do nich aliasy: NumberOfRows, NumberOfCustomers
*/

SELECT Count(CustomerId) AS NumberOfCustomers, count(DISTINCT CustomerId) AS NumberOfCustomers
FROM 'Order';

/*
5. Podane jest poniższe zapytanie:
SELECT COUNT(*) AS NumberOfRows,
       COUNT(DISTINCT CustomerId) AS NumberOfCustomers 
FROM "Order";
Dodaj trzecią kolumnę, która wyliczy procent unikalnych klientów w tabeli Order.
Przypisz do niej alias: PctOfUniqueCustomers
Zwróć uwagę na dzielenie przez liczbę całkowitą. Aby zamienić liczbę całkowitą 
na zmiennoprzecinkową można ją pomnożyć przez 1.0. 
*/

SELECT COUNT(*) AS NumberOfRows,
       COUNT(DISTINCT CustomerId) AS NumberOfCustomers, 
	   COUNT(DISTINCT CustomerId) / (COUNT(*) *1.0) AS PctOfUniqueCustomers
FROM "Order";

/*
6. Wyznacz trzy wartości:
     * liczbę rekordów w tabeli Order
     * liczbę niepustych wartości kolumny ShippedDate
     * procent brakujących danych w kolumnie ShippedDate
 i przypisz odpowiednio aliasy:
 	   * NumberOfRows
 	   * NumberOfNonMissingShippedDate
 	   * PctOfMissingShippedDate
*/

SELECT COUNT(*) AS NumberOfRows,
       Count(ShippedDate) AS NumberOfNonMissingShippedDate,
	   (COUNT(*) - Count(ShippedDate)) / (COUNT(*) *1.0) AS PctOfMissingShippedDate
FROM "Order";

-- 7. Wyznacz najstarszą datę zamówienia (kolumna OrderDate) z tabeli Order.

SELECT OrderDate
FROM 'Order'
ORDER BY OrderDate 
LIMIT 1;

SELECT MIN(OrderDate)
FROM 'Order';

-- 8. Wyznacz najnowszą datę zamówienia (kolumna OrderDate) z tabeli Order.

SELECT OrderDate
FROM 'Order'
ORDER BY OrderDate DESC
LIMIT 1;

SELECT MAX(OrderDate)
FROM 'Order';

-- 9. Wyznacz średnią wartość dla kolumny Freight w tabeli Order.

SELECT AVG(Freight)
FROM 'Order';
