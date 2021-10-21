CREATE SCHEMA IF NOT EXISTS training;

ALTER SCHEMA training RENAME TO training_zs;

DROP TABLE IF EXISTS training_zs.produts;
CREATE TABLE IF NOT EXISTS  training_zs.produts (
    id integer,
    production_qty NUMERIC (
        50,
        2
    ),
    product_name varchar (100),
    product_code varchar (10),
    description TEXT,
    manufacturing_date date
);

ALTER TABLE training_zs.produts ADD PRIMARY KEY (id);

--DROP TABLE IF EXISTS training_zs.produts;

CREATE TABLE training_zs.sales (
    id int PRIMARY KEY,
    sales_date timestamp NOT NULL,
    sales_amount NUMERIC (
        38,
        2
    ),
    sales_qty NUMERIC (
        10,
        2
    ),
    product_id int,
    added_by TEXT DEFAULT ('admin'),
    CONSTRAINT sales_over_1k CHECK (
        sales_amount > 1000
    )
);

ALTER TABLE training_zs.sales ADD FOREIGN KEY (product_id) REFERENCES training_zs.produts(id) ON
DELETE
    CASCADE;

DROP SCHEMA training_zs CASCADE