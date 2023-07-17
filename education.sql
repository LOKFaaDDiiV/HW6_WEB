-- Table: students
DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL,
    id_group INTEGER,
    FOREIGN KEY (id_group) REFERENCES groups (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

-- Table: groups
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_code VARCHAR(10) NOT NULL
);

-- Table: teachers
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL
);

-- Table: subjects
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(40) NOT NULL,
    id_teacher INTEGER NOT NULL,
    FOREIGN KEY (id_teacher) REFERENCES teachers (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

-- Table: grades
DROP TABLE IF EXISTS grades;
CREATE TABLE grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_student INTEGER NOT NULL,
    id_subject INTEGER NOT NULL,
    grade INTEGER NOT NULL,
    date_of DATE NOT NULL,
    FOREIGN KEY (id_student) REFERENCES students (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
    FOREIGN KEY (id_subject) REFERENCES subjects (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);
