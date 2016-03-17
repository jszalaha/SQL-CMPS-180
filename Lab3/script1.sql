/*
*	Lab3 - script1.sql
*	Author: Jordan Zalaha
*	email: jszalaha@ucsc.edu
*/

-- Set the following primary keys
-- within the following relations
ALTER TABLE mg_customers
ADD PRIMARY KEY (customer_id);

ALTER TABLE dv_address
ADD PRIMARY KEY (address_id);

ALTER TABLE dv_film
ADD PRIMARY KEY (film_id);

ALTER TABLE cb_books
ADD CONSTRAINT cb_books_pkey PRIMARY KEY (title, author_id, edition);

ALTER TABLE cb_authors
ADD PRIMARY KEY (author_id);