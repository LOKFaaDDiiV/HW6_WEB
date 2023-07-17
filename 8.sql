--Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT t.name AS Teacher, ROUND(AVG(g.grade), 2) AS Average_Grade
FROM grades AS g
JOIN subjects AS s ON g.id_subject = s.id
JOIN teachers AS t ON s.id_teacher = t.id
GROUP BY t.name