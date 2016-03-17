-- script3.sql
-- Author: Jordan Zalaha
-- Email: jszalaha@ucsc.edu

-- Select all tuples from dv_customer and insert them into mg_customers 
INSERT INTO mg_customers (customer_id, first_name, last_name, email, address_id, active)
SELECT dv_customer.customer_id, dv_customer.first_name, dv_customer.last_name, 
	dv_customer.email, dv_customer.address_id, dv_customer.active
FROM dv_customer;

-- Create sequence that will start new
-- customer_id values at 600 in mg_customers table
CREATE SEQUENCE mg_customers_seq START 600;

-- Set default next value of the customer_id
-- attribute in the mg_customers table to be
-- determined by the above sequence
ALTER TABLE mg_customers
ALTER COLUMN customer_id
SET DEFAULT NEXTVAL('mg_customers_seq');

-- Select all tuples from cb_customers table except
-- for those already represented in the dv_customer
-- table and insert them into mg_customers
INSERT INTO mg_customers (first_name, last_name)
SELECT *
FROM cb_customers
EXCEPT(SELECT first_name, last_name
		FROM dv_customer); 
