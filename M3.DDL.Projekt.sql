DROP SCHEMA IF EXISTS expence_tracker;
CREATE SCHEMA IF NOT EXISTS expence_tracker;

DROP TABLE IF EXISTS expence_tracker.bank_accaunt_owner;
CREATE TABLE IF NOT EXISTS expence_tracker.bank_accaunt_owner(
    id_ba_own integer CONSTRAINT id_ba_own PRIMARY KEY,
    owner_name varchar  ( 50 ) NOT NULL ,
    owner_desc varchar ( 250 ),
    user_login integer NOT NULL ,
    active boolean NOT NULL DEFAULT true
);

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

DROP TABLE IF EXISTS expence_tracker.transaction_category;
CREATE TABLE IF NOT EXISTS expence_tracker.transaction_category(
    id_trans_cat integer CONSTRAINT id_trans_cat PRIMARY KEY,
    category_name varchar  ( 50 ) NOT NULL ,
    category_description varchar ( 250 ),
    active boolean NOT NULL DEFAULT TRUE,
    insert_date timestamp DEFAULT current_timestamp,
    update_date timestamp DEFAULT current_timestamp
);

