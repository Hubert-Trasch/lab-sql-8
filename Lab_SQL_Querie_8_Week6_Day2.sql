-- LABS
-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

select title,length,rank () over (order by length) as 'rank' from film
where length<>' ' and length<>'' and length<>0;-- Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, rating and the rank.select title, rating,length,dense_rank() over(partition by rating order by length) as 'rank' from film
where length<>' ' and length<>'' and length<>0;

-- How many films are there for each of the categories in the category table. Use appropriate join to write this query

select category_id,count(length) as number_films from film a
join film_category l on a.film_id = l.film_id
group by category_id;



-- select category_id,count(film_id) from film_category
-- group by category_id;

-- Which actor has appeared in the most films?

select first_name,last_name,count(film_id) as number_films from actor a
join film_actor l on a.actor_id = l.actor_id
group by last_name,first_name
-- having last_name ='GUINESS'
order by count(film_id) desc;

-- Most active customer (the customer that has rented the most number of films)

select first_name,last_name,count(rental_id) as number_of_rentals from customer a
join rental l on a.customer_id=l.customer_id
group by first_name,last_name
order by count(rental_id) desc
limit 5;


