SELECT name FROM teacher
WHERE dept IS NULL

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name FROM teacher
LEFT JOIN dept ON (teacher.dept=dept.id);

SELECT teacher.name, dept.name FROM teacher
RIGHT JOIN dept ON (teacher.dept=dept.id);

SELECT name, COALESCE(mobile,'07986 444 2266') FROM teacher

SELECT teacher.name, COALESCE(dept.name,'None') 
FROM teacher
LEFT JOIN dept ON (dept.id=dept)

SELECT COUNT(name), COUNT(mobile) FROM teacher

SELECT dept.name,COUNT(teacher.name) FROM dept
LEFT JOIN teacher ON (dept=dept.id)
GROUP BY dept.name

SELECT name 
   ,CASE WHEN dept=1 OR dept=2
    THEN 'Sci'
    ELSE 'Art'
    END
FROM teacher 

SELECT name 
   ,CASE WHEN dept=1 OR dept=2
    THEN 'Sci'
    WHEN dept=3
    THEN 'Art'
    ELSE 'None'
    END
FROM teacher 