--Знайти оцінки студентів в окремій групі з певного предмета.
SELECT s.name AS Student, g.grade AS Grade
FROM grades AS g
JOIN students AS s ON g.id_student = s.id
JOIN groups AS g2 ON s.id_group = g2.id
JOIN subjects AS s2 ON g.id_subject = s2.id
WHERE g2.group_code = '102' AND s2.name = 'History'