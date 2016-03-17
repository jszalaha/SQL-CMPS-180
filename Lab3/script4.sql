/*
*	Lab3 - script4.sql
*	Author: Jordan Zalaha
*	email: jszalaha@ucsc.edu
*/

-- Violates Foreign Key Constraint
DELETE FROM dv_address
WHERE address_id = 0;

-- 1.
-- Satisfies edition_number Constraint
INSERT INTO cb_books (title, author_id, edition, publisher)
VALUES ('Do Androids Dream of Electric Sheep?', 55, 17, 'Del Rey');
-- Violates edition_number Constraint
INSERT INTO cb_books (title, author_id, edition)
VALUES ('The Sirens of Titan', 29, -1);

-- 2.
-- Satisfies address_id_non_null Constraint
INSERT INTO mg_customers (first_name, last_name, address_id)
VALUES ('Margaret', 'Thatcher', 0);
-- Violates address_id_non_null Constraint
INSERT INTO mg_customers (first_name, last_name)
VALUES ('Keanu', 'Reeves');

-- 3.
-- Satisfies address_non_empty Constraint
INSERT INTO dv_address (address_id, address, district, city_id)
VALUES (606, '777 Nowhere Drive', 'California', 120);
-- Violates address_non_empty Constraint
INSERT INTO dv_address (address_id, district, city_id)
VALUES (607, 'California', 120);