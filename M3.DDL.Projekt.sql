DROP SCHEMA IF EXISTS expence_tracker CASCADE ;
-- Usuwanie schematu w opcji CASCADE w sumie nie wiem jak zadzia³a to polecenie je¿eli by dane by³y
-- pobierane dopowi¹zanych  tabel w tym lub innym schemacie
CREATE SCHEMA IF NOT EXISTS expence_tracker;
--1
DROP TABLE IF EXISTS expence_tracker.bank_accaunt_owner;
CREATE TABLE IF NOT EXISTS expence_tracker.bank_accaunt_owner(
    id_ba_own integer CONSTRAINT id_ba_own PRIMARY KEY,
    owner_name varchar  ( 50 ) NOT NULL ,
    owner_desc varchar ( 250 ),
    user_login integer NOT NULL ,
    active boolean NOT NULL DEFAULT TRUE,
    insert_date timestamp DEFAULT current_timestamp,
    update_date timestamp DEFAULT current_timestamp
);
--2
DROP TABLE IF EXISTS expence_tracker.bank_accaunt_types;
CREATE TABLE IF NOT EXISTS expence_tracker.bank_accaunt_types(
    id_ba_type integer CONSTRAINT id_ba_type PRIMARY KEY,
    id_ba_own integer CONSTRAINT ,
    ba_type varchar  ( 50 ) NOT NULL ,
    ba_desc varchar ( 250 ),
    active boolean NOT NULL DEFAULT TRUE,
    is_common_account boolean NOT NULL DEFAULT TRUE,
    id_ba_own integer,
    insert_date timestamp DEFAULT current_timestamp,
    update_date timestamp DEFAULT current_timestamp
);
--3
DROP TABLE IF EXISTS expence_tracker.transactions;
CREATE TABLE IF NOT EXISTS expence_tracker.transactions(
    id_transaction integer CONSTRAINT id_transaction PRIMARY KEY,
    id_trans_ba integer,
    id_trans_cat integer,
    id_trans_subcat integer,
    id_trans_type integer,
    id_user integer,
    transaction_date date DEFAULT current_date,
    transaction_value NUMERIC (9,2),
    transaction_description TEXT,
    insert_date timestamp DEFAULT current_timestamp,
    update_date timestamp DEFAULT current_timestamp
);
--4
DROP TABLE IF EXISTS expence_tracker.transaction_bank_accaunts;
CREATE TABLE IF NOT EXISTS expence_tracker.transaction_bank_accaunts(
    id_trans_ba integer CONSTRAINT id_trans_ba PRIMARY KEY,
    id_ba_own integer,
    id_ba_type integer,
    bank_accaunt_name varchar  ( 50 ) NOT NULL ,
    bank_accaunt_desc varchar ( 250 ),
    active boolean NOT NULL DEFAULT TRUE,
    insert_date timestamp DEFAULT current_timestamp,
    update_date timestamp DEFAULT current_timestamp
);

--5
DROP TABLE IF EXISTS expence_tracker.transaction_category;
CREATE TABLE IF NOT EXISTS expence_tracker.transaction_category(
    id_trans_cat integer CONSTRAINT id_trans_cat PRIMARY KEY,
    category_name varchar  ( 50 ) NOT NULL ,
    category_description varchar ( 250 ),
    active boolean NOT NULL DEFAULT TRUE,
    insert_date timestamp DEFAULT current_timestamp,
    update_date timestamp DEFAULT current_timestamp
);

--6
DROP TABLE IF EXISTS expence_tracker.transaction_subcategory;
CREATE TABLE IF NOT EXISTS expence_tracker.transaction_subcategory(
    id_trans_subcat integer CONSTRAINT id_trans_subcat PRIMARY KEY,
    id_trans_cat integer,
    subcategory_name varchar  ( 50 ) NOT NULL ,
    subcategory_description varchar ( 250 ),
    active boolean NOT NULL DEFAULT TRUE,
    insert_date timestamp DEFAULT current_timestamp,
    update_date timestamp DEFAULT current_timestamp
);

--7
DROP TABLE IF EXISTS expence_tracker.transaction_type;
CREATE TABLE IF NOT EXISTS expence_tracker.transaction_type(
    id_trans_type integer CONSTRAINT id_trans_type PRIMARY KEY,
    transaction_type_name varchar  ( 50 ) NOT NULL ,
    transaction_type_desc varchar ( 250 ),
    active boolean NOT NULL DEFAULT TRUE,
    insert_date timestamp DEFAULT current_timestamp,
    update_date timestamp DEFAULT current_timestamp
);

--8
DROP TABLE IF EXISTS expence_tracker.users;
CREATE TABLE IF NOT EXISTS expence_tracker.users(
    id_user integer CONSTRAINT id_user PRIMARY KEY,
    user_login varchar  ( 25 ) NOT NULL ,
    user_name varchar  ( 50 ) NOT NULL ,
    user_password varchar  ( 100 ) NOT NULL ,
    password_salt varchar  ( 100 ) NOT NULL ,
    active boolean NOT NULL DEFAULT TRUE,
    insert_date timestamp DEFAULT current_timestamp,
    update_date timestamp DEFAULT current_timestamp
);

 
