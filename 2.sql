--Знайти студента із найвищим середнім балом з певного предмета.
SELECT s.name AS Student_Name, AVG(g.grade) AS avg_grade
FROM grades AS g
JOIN students AS s ON g.id_student = s.id
JOIN subjects AS s2 ON g.id_subject = s2.id
WHERE s2.name = 'History'
GROUP BY s.id
ORDER BY avg_grade DESC
LIMIT 1