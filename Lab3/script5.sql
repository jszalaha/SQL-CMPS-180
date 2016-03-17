/*
*	Lab3 - script5.sql
*	Author: Jordan Zalaha
*	email: jszalaha@ucsc.edu
*/

-- Create View: customer_city(first_name, last_name, city_id)
CREATE VIEW customer_city AS
	SELECT c.first_name, c.last_name, a.city_id
	FROM mg_customers c, dv_address a
	WHERE c.address_id = a.address_id;

-- Create View: district_stats(district, num_of_customers)
CREATE VIEW district_stats AS
	SELECT a.district, COUNT(c.customer_id) AS num_of_customers
	FROM dv_customer c, dv_address a
	WHERE c.address_id = a.address_id
	GROUP BY a.district
	ORDER BY COUNT(c.customer_id);

-- Find the district with the most customers
SELECT d1.district 
FROM district_stats d1
WHERE d1.num_of_customers >= ALL(	SELECT d2.num_of_customers
									FROM district_stats d2);

-- Find number of districts with only 1 customer
SELECT COUNT(district)
FROM district_stats
WHERE num_of_customers = 1
GROUP BY num_of_customers;

-- Rename customer_city view to city_customer
ALTER VIEW customer_city
RENAME TO city_customer;