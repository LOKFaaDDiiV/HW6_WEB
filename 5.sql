--Знайти, які курси читає певний викладач.
SELECT s.name AS Subject
FROM subjects AS s
JOIN teachers AS t ON s.id_teacher = t.id
WHERE t.name = 'Kelli Jennings'