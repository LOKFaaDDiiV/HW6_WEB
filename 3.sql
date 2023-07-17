--Знайти середній бал у групах з певного предмета.
SELECT g.group_code AS _Group_, ROUND(AVG(g2.grade), 2) AS Average_Grade
FROM grades AS g2
JOIN students AS s ON g2.id_student = s.id
JOIN groups AS g ON s.id_group = g.id
JOIN subjects AS s2 ON g2.id_subject = s2.id
WHERE s2.name = 'History'
GROUP BY _Group_