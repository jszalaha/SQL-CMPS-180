/*
*	Lab3 - script2.sql
*	Author: Jordan Zalaha
*	email: jszalaha@ucsc.edu
*/

-- Creates Constraint: address_id_fkey
-- mg_customers(address_id) references dv_address(address_id)
ALTER TABLE mg_customers
ADD CONSTRAINT address_id_fkey FOREIGN KEY (address_id) 
	REFERENCES dv_address (address_id);

-- Creates Constraint: author_id_fkey
-- cb_books(author_id) references cb_authors(author_id)	
ALTER TABLE cb_books
ADD CONSTRAINT author_id_fkey FOREIGN KEY (author_id) 
	REFERENCES cb_authors (author_id);