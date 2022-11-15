-- Usuń tabelę tymczasową company jeśli istnieje. Użyj odpowiedniego polecenia.

DROP TABLE IF EXISTS temp.company;

-- Utwórz tabelę tymczasową o nazwie company posiadającą kolumny
--    * id - liczba całkowita, klucz główny 
--    * company_name - tekst, nie może być wartością NULL
--    * country - tekst z domyślną wartością 'Poland'

CREATE TEMP TABLE company(
		id 				INTEGER PRIMARY KEY,
		company_name 	TEXT 	NOT NULL,
		country 		TEXT	DEFAULT 'Poland'
);

-- Wstaw jeden rekord do tabeli company przekazując wartości dla wszystkich kolumn:
--     * 1
--     * 'Microsoft'
--     * 'USA'
-- Wyświetl zawartość tabeli company.

INSERT INTO temp.company(id, company_name, country)
VALUES (1,'Microsoft', 'USA');
SELECT * FROM company;

-- Wstaw jeden rekord do tabeli company przekazując wartość tylko dla kolumny: 
--     * company_name -> 'Playway'
-- Wyświetl zawartość tabeli company.

INSERT INTO temp.company(company_name)
VALUES ('Playway');
SELECT * FROM company;

-- Usuń tabelę tymczasową company.

DROP TABLE IF EXISTS temp.company;