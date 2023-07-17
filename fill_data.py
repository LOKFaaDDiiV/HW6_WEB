from datetime import datetime
import faker
from random import randint, choice
import sqlite3

NUMBER_TEACHERS = 5
NUMBER_STUDENTS = 50
NUMBER_GROUPS = 3


def generate_fake_data(number_teachers, number_students, number_groups) -> tuple:
    fake_teachers = []  # імена викладачів
    fake_students = []  # імена студентів
    fake_groups = [str(100+i) for i in range(number_groups)]  # генератор груп
    fake_subjects = [
        'Mathematics',
        'History',
        'English',
        'Computer Science',
        'Art',
        'Economics',
        'Music',
        'Physical Education'
    ]
    # fake_grades = ['A', 'B', 'C', 'D', 'E', 'FX', 'F']

    fake_data = faker.Faker()

    for _ in range(number_teachers):
        fake_teachers.append(fake_data.name())

    for _ in range(number_students):
        fake_students.append(fake_data.name())

    return fake_teachers, fake_students, fake_groups, fake_subjects


def prepare_data(teachers, students, groups, subjects) -> tuple:
    for_teachers = []
    # готуємо список кортежів назв teachers
    for teacher in teachers:
        for_teachers.append((teacher, ))  # name

    for_students = []  # для таблиці students

    for student in students:
        for_students.append((student, randint(1, len(groups))))  # name id_group

    for_groups = []

    for group in groups:
        for_groups.append((group, ))  # group_code

    for_subjects = []

    for subject in subjects:
        for_subjects.append((subject, randint(1, len(teachers))))  # name id_teacher

    for_grades = []

    for student in range(len(students)):
        for grade in range(21):
            grade_date = datetime(2022, randint(1, 6), randint(10, 20)).date()
            for_grades.append((student + 1, randint(1, len(subjects)), randint(60, 100), grade_date))  # можливі помилки
        # id_student id_subject grade date_of

    return for_teachers, for_students, for_groups, for_subjects, for_grades


def insert_data_to_db(teachers, students, groups, subjects, grades) -> None:
    # Створимо з'єднання з нашою БД та отримаємо об'єкт курсору для маніпуляцій з даними

    with sqlite3.connect('education.db') as con:

        cur = con.cursor()
        # ------------------------------------------------------------------------
        sql_to_teachers = """INSERT INTO teachers(name)
                               VALUES (?)"""

        cur.executemany(sql_to_teachers, teachers)
        # ------------------------------------------------------------------------
        sql_to_students = """INSERT INTO students(name, id_group)
                               VALUES (?, ?)"""

        cur.executemany(sql_to_students, students)
        # ------------------------------------------------------------------------
        sql_to_groups = """INSERT INTO groups(group_code)
                              VALUES (?)"""

        cur.executemany(sql_to_groups, groups)
        # ------------------------------------------------------------------------
        sql_to_subjects = """INSERT INTO subjects(name, id_teacher)
                                      VALUES (?, ?)"""

        cur.executemany(sql_to_subjects, subjects)
        # ------------------------------------------------------------------------
        sql_to_grades = """INSERT INTO grades(id_student, id_subject, grade, date_of)
                                      VALUES (?, ?, ?, ?)"""

        cur.executemany(sql_to_grades, grades)

        # Фіксуємо наші зміни в БД

        con.commit()


if __name__ == "__main__":
    teachers, students, groups, subjects, grades = prepare_data(*generate_fake_data(NUMBER_TEACHERS, NUMBER_STUDENTS, NUMBER_GROUPS))
    insert_data_to_db(teachers, students, groups, subjects, grades)
