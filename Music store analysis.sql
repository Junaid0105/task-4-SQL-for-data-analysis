-- Q1: Who is the senior most employee based on job title?
Select * from employee
order by levels desc
limit 1



-- Q2: Which countries hava most invoices?
Select count(*) as Highest_invoice, billing_country
from invoice
group by billing_country
order by Highest_invoice desc
limit 1




-- Q2: What are the Top 3 values of total invoice?
Select total from invoice
order by total desc
limit 3

/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city
     we made the most moeny. Write the query that returns one city that has the highest sum of invoices totals.
    Return both the city name and sum of all invoices totals */

	Select SUM(total) as invoice_total, billing_city
	from invoice
	group by billing_city
	order by invoice_total desc
	

/* Q5: Who is the best customer? The customer who has spent the most money will 
       be declared the best customer. Write a query that returns the person who
	   has spent the most money. */

	Select customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as total
	from customer
	join invoice on customer.customer_id = invoice.customer_id
	group by customer.customer_id
	order by total desc
	limit 1





		/* Q6: Write a Query to return the email, first name, last name,
       genre of all Rock Music Listeners. Return your list ordered alphabetically
	   by email starting with A */
	SELECT DISTINCT email,first_name, last_name
	FROM customer
	JOIN invoice ON customer.customer_id = invoice.customer_id
	JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
	WHERE track_id IN(
		SELECT track_id FROM track
		JOIN genre ON track.genre_id = genre.genre_id
		WHERE genre.name LIKE 'Rock'
	)
	ORDER BY email;     


















