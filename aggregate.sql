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

/*Use the SUM function to get the total duration of all films.*/

SELECT SUM(duration)
FROM films;