-- 1. Pogrupuj dane z tabeli Order na poziomie CustomerId i wyznacz dla każdego klienta
-- liczbę zamównień.

SELECT CustomerId,
		COUNT(*) AS NoofOrders
FROM 'Order'
GROUP BY CustomerId;

-- 2. Pogrupuj dane z tabeli Order na poziomie CustomerId i wyznacz dla każdego klienta
-- liczbę zamównień. Wynik posortuj malejąco po liczbie zamównień. 

SELECT CustomerId,
		Count(*) AS NoofOrders
FROM 'Order'
GROUP BY CustomerId
ORDER BY NoofOrders DESC;

-- 3. Pogrupuj dane z tabeli Order na poziomie OrderDate i wyznacz dla każdej daty
-- liczbę zamównień. Wynik posortuj malejąco po liczbie zamównień i ogranicz do
-- 10 pierwszych rekordów.

SELECT OrderDate,
		Count(*) AS NoofOrders
FROM 'Order'
GROUP BY OrderDate
ORDER BY NoofOrders DESC
LIMIT 10;

-- 4. Pogrupuj dane z tabeli Order na poziomie ShipCountry i wyznacz dla każdego kraju
-- liczbę zamównień. W wyniku pozostaw kraje, które mają więcej niż 50 zamówień.
-- Wynik posortuj malejąco po liczbie zamównień. 

SELECT ShipCountry,
		Count(*) AS NoofOrders
FROM 'Order'
GROUP BY ShipCountry
HAVING NoofOrders > 50
ORDER BY NoofOrders DESC;

-- 5. Pogrupuj dane z tabeli Order na poziomie ShipCountry oraz ShipCity i wyznacz 
-- dla każdej pary kraj <-> miasto liczbę zamównień. Wynik posortuj po malejącej
-- liczbie zamówień.

SELECT ShipCountry,ShipCity,
		Count(*) AS NoofOrders
FROM 'Order'
GROUP BY ShipCountry, ShipCity

-- 6. Pogrupuj dane z tabeli Order na poziomie ShipCountry i wyznacz średnią wartość
-- dla kolumny Freight. Wynik posortuj malejąco po średniej wartości tej kolumny.

SELECT ShipCountry,
		AVG(Freight) AS New
FROM 'Order'
GROUP BY ShipCountry
ORDER BY New DESC
