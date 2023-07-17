--Знайти список курсів, які відвідує студент.
SELECT DISTINCT s.name AS Subject
FROM subjects AS s
JOIN grades AS g ON g.id_subject = s.id
JOIN students AS s2 ON g.id_student = s2.id
WHERE s2.name = 'Frederick Saunders'