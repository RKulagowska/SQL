-- Usuń tabele company oraz stock_exchange o ile istnieją.

DROP TABLE IF EXISTS company; 
DROP TABLE IF EXISTS stock_exchange; 

-- Utwórz tabelę o nazwie stock_exchange i kolumnach:
--     * id -> liczba całkowita, klucz główny
--     * name -> tekst, bez wartości NULL
--     * country -> tekst, bez wartości NULL

-- Utwórz tabelę o nazwie company i kolumnach:
--     * id -> liczba całkowita, klucz główny
--     * company_name -> tekst, bez wartości NULL
--     * country -> tekst, domyślnie 'USA'
--     * stock_exchange_id -> liczba całkowita, bez wartości NULL
-- Dodaj ograniczenie klucza obcego na poziomie tabeli do kolumny stock_exchange_id, 
-- która odnosi się do kolumny id tabeli stock_exchange.

CREATE TABLE stock_exchange(
		id 		INTEGER PRIMARY KEY,
		name 	TEXT 	NOT NULL,
		country TEXT 	NOT NULL
);
CREATE TABLE company(
		id 					INTEGER PRIMARY KEY,
		company_name 		TEXT 	NOT NULL,
		country 			TEXT 	DEFAULT 'USA',
		stock_exchange_id 	INTEGER NOT NULL,
		FOREIGN KEY(stock_exchange_id)
		REFERENCES stock_exchange(id)
);

-- Wykonaj poniższe polecenie.
INSERT INTO stock_exchange (name, country)
VALUES ('London Stock Exchange Group', 'United Kingdom'),
	   ('Nasdaq', 'USA'),
	   ('Shanghai Stock Exchange', 'Shanghai'),
	   ('New York Stock Exchange', 'USA');
	   
-- Wyświetl tabelę stock_exchange.	   
SELECT * FROM stock_exchange;
	   
-- Wstaw poniższe rekordy do tabeli company.	
-- Wyświetl tabelę company 
INSERT INTO company (company_name, country, stock_exchange_id)
VALUES ('Microsoft', 'USA', 2);

INSERT INTO company (company_name, country, stock_exchange_id)
VALUES ('Amazon', 'USA', 2);

INSERT INTO company (company_name, country, stock_exchange_id)
VALUES ('JPMorgan', 'USA', 4);
SELECT * FROM company;
	   
-- Wykonaj połączenie typu LEFT JOIN tabel company oraz stock_exchange. 
-- W tabeli wynikowej wyświetl kolumny:
--     * id z tabeli company
--     * company_name
--     * country z tabeli company
--     * name	

SELECT C.id,
	   C.company_name,
	   C.country,
	   S.name
FROM company AS C 
LEFT JOIN stock_exchange AS S ON C.stock_exchange_id == S.id;

