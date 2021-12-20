SELECT * FROM pg_catalog.pg_roles

--brak podanego uprawnienia do logowania  do bazy
CREATE ROLE training_user WITH SUPERUSER PASSWORD 'szaman';
--dodanie LOGIN - umo�liwi zalogowanie do bazy danych
CREATE ROLE training_user WITH LOGIN SUPERUSER PASSWORD 'szaman';

-- zabieramy uprawnienia do schematu public i roli PUBLIC
REVOKE CREATE ON SCHEMA public FROM PUBLIC;

-- zabieramy wszystkie uprawnienia dla bazy postgres i roli PUBLIC
REVOKE ALL ON DATABASE  postgres TO PUBLIC;

-- nadajemy jedno uprawnienie do ��czenia si� z baz�
GRANT CONNECT ON DATABASE postgres TO PUBLIC;
-- inny przyk�ad
GRANT SELECT ON sales TO admin_ro;

--polecenie do przenoszenia w�asno�ci obiekt�w z jednego u�ytkownika na drugiego
REASSIGN OWNED BY accountant TO postgres;
--teraz mo�na usun�� obiekty nale��ce do accautant
DROP OWNED BY accountan;
--usuni�cie roli 
DROP ROLE accountant;


-- prawid�owa kolejno�� tworzenia roli, u�ytkownika i dodawanie odp uprawnie�
--tworzymy u�ytkwnika
CREATE ROLE accountant WITH LOGIN PASSWORD 'mikimouse$';
REVOKE ALL PRIVILEGES ON SCHEMA public FROM PUBLIC;

--tworzymy grupa z uprawnieniami
CREATE ROLE readonly_accountants;
GRANT CONNECT ON DATABASE postgre TO readonly_accountants;

--tworzymy schemat dla tego u�ytkownika
CREATE SCHEMA accountants;
--tworzymy tabele 
CREATE TABLE accountants.test (id integer);

--dodajemy dost�p do schematu
GRANT USAGE ON SCHEMA accountants TO readonly_accountants;
--dodajemy dost�p do tabeli
GRANT SELECT ON TABLE accountants.test TO readonly_accountants;

--grupa readonly_accountants ma wszystkie potrzebne przywileje
-- mo�na do niej przypisa� odp u�ytkownika
GRANT readonly_accountants TO accountant;

--Odbieranie uprawnie�, kt�rych nie potrzebuje ju� u�ytkownik np
REVOKE SELECT ON sales FROM admin_ro

--polecenie DENY  - blokuje dost�p jest wa�niejsze ni� grant - npr jst MSSQL
-- Deny select on sales to ADMIN 


