SELECT COUNT(id)from stops

SELECT id FROM stops
WHERE name ='Craiglockhart' 

SELECT stops.id, stops.name
FROM stops INNER JOIN route ON stops.id=route.stop
WHERE route.num='4' AND route.company='LRT';