-- script4.sql
-- Author: Jordan Zalaha
-- Email: jszalaha@ucsc.edu

-- Select the first and last names and phone numbers of all people
-- who are customers of both Smith Video and Smith Books.
SELECT a.first_name, a.last_name, c.phone
FROM dv_customer a, cb_customers b, dv_address c
WHERE a.first_name = b.first_name AND
      a.last_name = b.last_name AND
      a.address_id = c.address_id;

-- Select publisher names and the number of first edition books per 
-- publisher, sorted in descending order.  
SELECT publisher, COUNT(title)
FROM cb_books
WHERE edition = 1
GROUP BY publisher
ORDER BY COUNT(title) DESC;

-- Select the first and last names of all customers who live
-- in the district having the most customers.
SELECT a.first_name, a.last_name
FROM mg_customers a, dv_address b
WHERE a.address_id = b.address_id AND
	  b.district = (SELECT district 
					FROM dv_address
					GROUP BY district
					ORDER BY count(address_id) DESC LIMIT 1);

-- Select the rating that is most common among films in the Smith
-- Video database and how many films have that rating.					
SELECT rating, COUNT(film_id)
FROM dv_film
GROUP BY rating
ORDER BY COUNT(film_id) DESC LIMIT 1;

-- Select the first and last names of the top 10 authors when 
-- ranked by the number of books each has written.
SELECT a.first_name, a.last_name, COUNT(b.title)
FROM cb_authors a, cb_books b
WHERE a.author_id = b.author_id
GROUP BY b.author_id, a.first_name, a.last_name
ORDER BY count(b.title) DESC LIMIT 10;