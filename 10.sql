--Список курсів, які певному студенту читає певний викладач.
SELECT DISTINCT s.name AS Subject
FROM subjects AS s
JOIN grades AS g ON g.id_subject = s.id
JOIN students AS s2 ON g.id_student = s2.id
JOIN teachers AS t ON s.id_teacher = t.id
WHERE s2.name = 'Frederick Saunders' AND t.name = 'Kelli Jennings'