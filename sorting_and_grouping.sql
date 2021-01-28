/* films table fields are 

id
title
release_year
country
duration
language
certification
gross
budget

*/


/* people table fields are 

id
name
birthdate
deathdate

*/



/*Get the names of people from the people table, sorted alphabetically.*/

SELECT name
FROM people
ORDER BY name;

/*Get the names of people, sorted by birthdate*/

SELECT name
FROM people
ORDER BY birthdate;

/*Get the birthdate and name for every person, in order of when they were born*/

SELECT birthdate, name
FROM people
ORDER BY birthdate;

/*Get the title of films released in 2000 or 2012, in the order they were released*/

SELECT title
FROM films
WHERE release_year IN (2000, 2012)
ORDER BY release_year;

/*Get all details for all films except those released in 2015 and order them by duration*/

SELECT * 
FROM films
WHERE release_year <> 2015
ORDER BY duration;

/*Get the title and gross earnings for movies which begin with the letter 'M' and order the resuls alphabetically.*/

SELECT title, gross
FROM films
WHERE title LIKE 'M%'
ORDER BY title;


/* reviews table fields are 

id
film_id
num_user
num_critic
imdb_score
num_votes
facebook_likes

*/


/*Get the IMDB score and film ID for every film from the reviews table, sorted form highest to lowest score.*/

SELECT imdb_score, film_id
FROM reviews
ORDER BY imdb_score DESC;

/*Get the title for every film, in reverse order.*/

SELECT title
FROM films
ORDER BY title DESC;

/*Get the title and duration for every film, in order of longest duration to shorest.*/

SELECT title, duration
FROM films
ORDER BY duration DESC;

/*Get the birthdate and name of people in the people table, in order of when they were born and alphabetically by name.*/

SELECT birthdate, name
FROM people
ORDER BY birthdate, name;

/*Get the release_year, duration, and title of films ordered by their release_year and duration*/

SELECT release_year, duration, title
FROM films
ORDER BY release_year, duration;

/*Get certifications, release_year, and titles of films order by certification(alphabetically) and release_year.*/

SELECT certification, release_year, title
FROM films
ORDER BY certification, release_year;

/*Get the names and birthdates of people ordered by name and birthdate.*/

SELECT name, birthdate
FROM people
ORDER BY name, birthdate;


/*
A word of warning: SQL will return an error if you try to SELECT a field that is not in your GROUP BY clause without using it to calculate some kind of value about the entire group.
*/


/*Get the release_year and count of films released in each year.*/

SELECT release_year, COUNT(*)
FROM films
GROUP BY release_year;

/*Get the release_year and average duration of all films, grouped by release year.*/

SELECT release_year, AVG(duration)
FROM films 
GROUP BY release_year;

/*Get the release_year and largest budget for all films, grouped by release_year.*/

SELECT release_year, MAX(budget)
FROM films
GROUP BY release_year;

/*Get the IMDB score and count of film reviews grouped by IMDB score in the reviews table.*/

SELECT imdb_score, COUNT(*)
FROM reviews
GROUP BY imdb_score;

/*Get the release_year and lowest gross earnings per release_year.*/

SELECT release_year, MIN(gross)
FROM films
GROUP BY release_year;

/*Get the language and total gross amount films in each language made.*/

SELECT language, SUM(gross)
FROM films
GROUP BY language;

/*Get the country and total budget spent making movies in each country.*/

SELECT country, SUM(budget)
FROM films 
GROUP BY country;

/*Get the release_year, country and highest budget spent making a film for each year, for each country. Sort your results by release year and country.*/
 
SELECT release_year, country, MAX(budget)
FROM films
GROUP BY release_year, country
ORDER BY release_year, country;

/*Get the country, release year, and lowest amount grossed per release year per country. Order your results by country and release year.*/

SELECT country, release_year, MIN(gross)
FROM films
GROUP BY country, release_year
ORDER BY country, release_year;

/*In how manu different years were more than 200 movies released?*/

SELECT release_year
FROM films
GROUP BY release_year
HAVING COUNT(*) > 200
ORDER BY release_year;


/*
Now you're going to write a query that returns the average budget and average gross earnings for films in each year after 1990, if the average budget is greater than $60 million.
*/


/*Get the release year, budget and gross earnings for each film in the films table.*/

SELECT release_year, budget, gross
FROM films;

/*Modify your query so that only records with a release_year after 1990 are included.*/

SELECT release_year, budget, gross
FROM films
WHERE release_year > 1990;

/*Remove the budget and gross columns, and group your results by release_year.*/

SELECT release_year
FROM films
WHERE release_year > 1990
GROUP BY release_year;

/*Modify your query to include the average budget and average gross earnings for the results you have so far. Alias the average budget as avg_budget; alias the average gross earning as avg_gross.*/

SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year;  

/*Modify your query so that only years with an average budget of greater than $60 million are included.*/

SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000;

/*Finally, modify your query to order the results from highest average gross earnings to lowest.*/

SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
ORDER BY avg_gross DESC;

/*Get the country, average budget, and average gross take of countries that have made more than 10 films. Order the result by country name, and limit the number of results displayed to 5. You should alias the averages as avg_budget and avg_gross respectively.*/

SELECT country, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
GROUP BY country
HAVING COUNT(title) > 10
ORDER BY country
LIMIT 5;

