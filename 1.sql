--Знайти 5 студентів із найбільшим середнім балом з усіх предметів.

SELECT s.name AS Name, ROUND(AVG(g.grade), 2) AS Average_Grade
FROM grades AS g
JOIN students AS s ON g.id_student = s.id
GROUP BY Name
ORDER BY Average_Grade DESC
LIMIT 5

--SELECT AVG(grade) AS Average, name
--FROM(SELECT g.grade, s.name
--	 FROM grades AS g
--	 JOIN students AS s ON g.id_student = s.id
--	 )
--GROUP BY name
--ORDER BY Average DESC
--LIMIT 5