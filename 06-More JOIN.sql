SELECT id, title
 FROM movie
 WHERE yr=1962

 SELECT yr FROM movie
WHERE title='Citizen Kane'

SELECT id, title, yr FROM movie
WHERE title LIKE 'Star Trek%' ORDER BY yr

SELECT id FROM actor
WHERE name='Glenn Close'

SELECT id FROM movie
WHERE title = 'Casablanca'

SELECT actor.name FROM actor
JOIN casting ON actor.id=casting.actorid
WHERE movieid=11768

SELECT actor.name FROM actor
JOIN casting on actor.id=casting.actorid
WHERE movieid = (
                 SELECT movie.id from movie WHERE movie.title='Alien')

SELECT title FROM movie
JOIN casting on movieid=movie.id
WHERE actorid =(
                  SELECT id from actor WHERE name='Harrison Ford')

SELECT title FROM movie
JOIN casting on movieid=movie.id
WHERE actorid =(
                  SELECT id from actor WHERE name='Harrison Ford')
AND casting.ord != 1

SELECT movie.title,actor.name FROM movie
JOIN casting ON movie.id=movieid JOIN actor ON casting.actorid=actor.id
WHERE casting.ord=1 AND yr=1962

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)

SELECT title,name FROM movie
            JOIN casting on movieid=movie.id AND ord=1
            JOIN actor on actor.id=actorid
WHERE movie.id IN (
  SELECT movieid FROM casting
  WHERE actorid IN (
    SELECT id FROM actor
    WHERE name='Julie Andrews')

SELECT actor.name
FROM actor JOIN casting ON (actor.id=casting.actorid)
WHERE casting.ord=1
GROUP BY actor.name
HAVING COUNT(actor.name) >= 30
ORDER BY actor.name ASC;

SELECT movie.title, COUNT(movieid) FROM movie
JOIN casting ON (movie.id=casting.movieid)
JOIN actor ON (casting.actorid=actor.id)
WHERE yr=1978
GROUP BY movie.title
ORDER BY COUNT(casting.movieid) DESC, movie.title;

SELECT actor.name FROM actor
JOIN casting ON (actor.id=casting.actorid)
JOIN movie ON (casting.movieid=movieid)
WHERE actor.name!='Art Garfunkel' AND casting.movieid=ANY(
SELECT casting.movieid FROM casting
WHERE casting.actorid=
(SELECT actor.id FROM actor WHERE actor.name='Art Garfunkel'))
GROUP BY actor.name;