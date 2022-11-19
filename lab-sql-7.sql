/* -- 1. In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name,
 you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. 
 So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list. */ 
-- 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
-- 3. Using the rental table, find out how many rentals were processed by each employee.
-- 4. Using the film table, find out how many films were released each year.
-- 5. Using the film table, find out for each rating how many films were there.
-- 6. What is the mean length of the film for each rating type? Round off the average lengths to two decimal places.
-- 7. Which kind of movies (rating) have a mean duration of more than two hours?

use sakila;

-- Q1. Which are the actors whose last names are not repeated?
SELECT actor_id, first_name, last_name, COUNT(last_name) 
FROM actor 
GROUP BY last_name
HAVING COUNT(last_name) = 1;

-- Q2. Which last names appear more than once?
SELECT actor_id, first_name, last_name, COUNT(last_name) 
FROM actor 
GROUP BY last_name
HAVING COUNT(last_name) > 1;

-- Q3. Using the rental table find out how many rentals were processed by each employee
SELECT staff_id, COUNT(staff_id) AS 'Rentals processes per Staff' FROM rental GROUP BY staff_id;

-- Q4. Using the film table, find out how many films were released each year.
SELECT COUNT(film_id), release_year FROM film GROUP BY release_year;

-- Q5. Using the film table, find out for each rating how many films were there.
SELECT rating, COUNT(rating) AS 'Count' FROM film GROUP BY rating;

-- Q6. What is the mean  average length of the film for each rating type? Round off the average lengths to two decimal places
SELECT ROUND(avg(length)) AS 'Average Length', rating FROM film GROUP BY rating;

-- Q8. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, avg(length) AS 'Average Length' 
FROM film 
GROUP BY rating
HAVING avg(length) > 120;