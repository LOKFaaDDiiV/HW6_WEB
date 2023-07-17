--Середній бал, який певний викладач ставить певному студентові.
SELECT ROUND(AVG(g.grade), 2) AS Average_Grade
FROM grades AS g
JOIN students AS s ON g.id_student = s.id
JOIN subjects AS s2 ON g.id_subject = s2.id
JOIN teachers AS t ON s2.id_teacher = t.id
WHERE s.name = 'Frederick Saunders' AND t.name = 'Kelli Jennings'