CREATE TABLE person
(
    person_id  INT AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name  VARCHAR(20) NOT NULL,
    dob        DATE,
    income     DOUBLE,
    PRIMARY KEY (person_id)
);

DROP TABLE person;

INSERT INTO person (first_name, last_name, dob, income)
VALUES ('Anna', 'Andersson', '1955-12-23', 234777),
       ('Bertil', 'Bertilsson', '1977-12-23', 235203),
       ('Christoffer', 'Christiansson', '1912-03-04', 122344),
       ('David', 'Dahlberg', '1999-06-01', 111836),
       ('Erik', 'Enberg', '1976-10-02', 145093);

SELECT *
FROM person
WHERE income > 200000;

UPDATE person
SET income = income * 2
WHERE person_id = 1;

DELETE
from person
WHERE person_id IN (1, 2);

/*
  Det som behöver göras är att ta bort kolumnen "courses" och istället skapa en ny tabell med alla kurserna i
  tillsammans med en koppling till person-tabellen.
*/

#   ta bort kolumn:
#   ALTER TABLE person DROP COLUMN courses;

#   skapa ny tabell:
CREATE TABLE students
(
    student_id   INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(20) NOT NULL
);
CREATE TABLE courses
(
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course    VARCHAR(20) NOT NULL
);

CREATE TABLE student_courses
(
    student_id INT NOT NULL,
    course_id  INT NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students (student_id),
    FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

#   infoga kurser i den nya tabellen:
INSERT INTO students (student_name)
VALUES ('Axel'),
       ('Bertil'),
       ('Christoffer');

#   infoga kurser i den nya tabellen:
INSERT INTO courses (course)
VALUES ('Math'),
       ('English'),
       ('Chemistry');

INSERT INTO student_courses (student_id, course_id)
VALUES (1,1),
       (1,2),
       (2,3),
       (3,2),
       (3,3);

CREATE TABLE telephone_number
(
    phone_id INT PRIMARY KEY AUTO_INCREMENT,
    phone_number VARCHAR(20) NOT NULL,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students (student_id)
);

INSERT INTO telephone_number (phone_number,student_id)
VALUES ('070-1111111', 1),
       ('070-2222222', 1),
       ('070-3333333', 2),
       ('070-5555555', 2);

DROP TABLE telephone_number;

SELECT s.student_name, p.phone_number
FROM students as s
         LEFT JOIN telephone_number AS p ON s.student_id = p.student_id