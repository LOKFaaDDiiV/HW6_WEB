--Оцінки студентів у певній групі з певного предмета на останньому занятті.
SELECT s.name, g.grade, g.date_of
FROM grades AS g
JOIN students AS s ON g.id_student = s.id
JOIN subjects AS s2 ON g.id_subject = s2.id
JOIN groups AS g2 ON s.id_group = g2.id
WHERE g2.group_code = '100' AND s2.name = 'History' AND g.date_of = (
SELECT MAX(g.date_of) FROM grades AS g
JOIN students AS s ON g.id_student = s.id
JOIN subjects AS s2 ON g.id_subject = s2.id
JOIN groups AS g2 ON s.id_group = g2.id
WHERE g2.group_code = '100' AND s2.name = 'History')