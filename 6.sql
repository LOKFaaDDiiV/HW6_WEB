--Знайти список студентів у певній групі.
SELECT s.name AS Student
FROM students AS s
JOIN groups AS g ON s.id_group  = g.id
WHERE g.group_code  = '101'