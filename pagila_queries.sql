SELECT UPPER(first_name || ' ' || last_name) as actor_name FROM actor;

SELECT UPPER(first_name || ' ' || last_name) as actor_name FROM actor
	WHERE last_name LIKE '%LI%';

SELECT last_name, COUNT(last_name) FROM actor
	GROUP BY last_name;

--add address
SELECT staff.first_name, staff.last_name, staff.staff_id, SUM(payment.amount) as total_payments
	FROM payment JOIN staff on payment.staff_id = staff.staff_id
	GROUP BY staff.staff_id;
	
SELECT actor.first_name, actor.last_name 
	FROM actor JOIN film_actor ON film_actor.actor_id = actor.actor_id 
	JOIN film ON film.film_id = film_actor.film_id
	WHERE film.title='ALONE TRIP';
	
SELECT customer.first_name, customer.last_name, COUNT(rental_id) as rental_count 
	FROM rental JOIN customer ON customer.customer_id = rental.customer_id
	GROUP BY customer.customer_id
	ORDER BY rental_count DESC 
	LIMIT 1;
	
SELECT customer.store_id, COUNT(rental.rental_id) AS num_rentals 
      FROM rental JOIN customer ON rental.customer_id = customer.customer_id
	  JOIN inventory ON inventory.inventory_id = rental.customer_id 
	  JOIN film_category ON inventory.film_id = film_category.film_id
	  JOIN category ON category.category_id = film_category.category_id
	  WHERE category.name = 'Family'
      GROUP BY customer.store_id
	  ORDER BY num_rentals DESC
	  LIMIT 1
	 ;
--OR ??? 
SELECT inventory.store_id, COUNT(rental.rental_id) AS num_rentals 
      FROM inventory JOIN rental ON rental.inventory_id = inventory.inventory_id
	  JOIN film_category ON inventory.film_id = film_category.film_id
	  JOIN category ON category.category_id = film_category.category_id
	  WHERE category.name = 'Family'
      GROUP BY inventory.store_id
	  ORDER BY num_rentals DESC
	  LIMIT 1;







