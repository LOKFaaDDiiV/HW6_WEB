--Знайти середній бал на потоці (по всій таблиці оцінок).
SELECT ROUND(AVG(g.grade), 2) AS Average_Grade
FROM grades AS g