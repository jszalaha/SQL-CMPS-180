/*
*	Lab3 - script3.sql
*	Author: Jordan Zalaha
*	email: jszalaha@ucsc.edu
*/

-- Create Constraint: edition_number
-- Prevents negative and zero editions
ALTER TABLE cb_books
ADD CONSTRAINT edition_number CHECK (edition > 0);

-- Insert a zero address record to replace null
-- address references
INSERT INTO dv_address (address_id, address) VALUES (0, 'NOT IN RECORD');
-- Replace all null address_ids with the 
-- zero address record reference
UPDATE mg_customers
SET address_id = 
	CASE WHEN address_id IS NULL
		 THEN 0
		 ELSE address_id
	END;
-- Create Constraint: address_id_non_null
-- Prevents null address_id values
ALTER TABLE mg_customers
ADD CONSTRAINT address_id_non_null CHECK (address_id IS NOT NULL);

-- Create Constraint: address_non_empty
-- Prevents empty address field in address records
ALTER TABLE dv_address
ADD CONSTRAINT address_non_empty CHECK (address <> '' AND address IS NOT NULL);
