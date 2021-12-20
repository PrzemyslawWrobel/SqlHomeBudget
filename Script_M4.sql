SELECT * FROM pg_catalog.pg_roles

--brak podanego uprawnienia do logowania  do bazy
CREATE ROLE training_user WITH SUPERUSER PASSWORD 'szaman';
--dodanie LOGIN - umo¿liwi zalogowanie do bazy danych
CREATE ROLE training_user WITH LOGIN SUPERUSER PASSWORD 'szaman';

-- zabieramy uprawnienia do schematu public i roli PUBLIC
REVOKE CREATE ON SCHEMA public FROM PUBLIC;

-- zabieramy wszystkie uprawnienia dla bazy postgres i roli PUBLIC
REVOKE ALL ON DATABASE  postgres TO PUBLIC;

-- nadajemy jedno uprawnienie do ³¹czenia siê z baz¹
GRANT CONNECT ON DATABASE postgres TO PUBLIC;
-- inny przyk³ad
GRANT SELECT ON sales TO admin_ro;

--polecenie do przenoszenia w³asnoœci obiektów z jednego u¿ytkownika na drugiego
REASSIGN OWNED BY accountant TO postgres;
--teraz mo¿na usun¹æ obiekty nale¿¹ce do accautant
DROP OWNED BY accountan;
--usuniêcie roli 
DROP ROLE accountant;


-- prawid³owa kolejnoœæ tworzenia roli, u¿ytkownika i dodawanie odp uprawnieñ
--tworzymy u¿ytkwnika
CREATE ROLE accountant WITH LOGIN PASSWORD 'mikimouse$';
REVOKE ALL PRIVILEGES ON SCHEMA public FROM PUBLIC;

--tworzymy grupa z uprawnieniami
CREATE ROLE readonly_accountants;
GRANT CONNECT ON DATABASE postgre TO readonly_accountants;

--tworzymy schemat dla tego u¿ytkownika
CREATE SCHEMA accountants;
--tworzymy tabele 
CREATE TABLE accountants.test (id integer);

--dodajemy dostêp do schematu
GRANT USAGE ON SCHEMA accountants TO readonly_accountants;
--dodajemy dostêp do tabeli
GRANT SELECT ON TABLE accountants.test TO readonly_accountants;

--grupa readonly_accountants ma wszystkie potrzebne przywileje
-- mo¿na do niej przypisaæ odp u¿ytkownika
GRANT readonly_accountants TO accountant;

--Odbieranie uprawnieñ, których nie potrzebuje ju¿ u¿ytkownik np
REVOKE SELECT ON sales FROM admin_ro

--polecenie DENY  - blokuje dostêp jest wa¿niejsze ni¿ grant - npr jst MSSQL
-- Deny select on sales to ADMIN 


