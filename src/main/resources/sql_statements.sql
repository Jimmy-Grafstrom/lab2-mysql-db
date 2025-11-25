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

SELECT * FROM person WHERE income > 200000;

UPDATE person SET income = income * 2 WHERE person_id = 1;

DELETE from person WHERE person_id IN (1, 2)

/*
  Det som behöver göras är att ta bort kolumnen "courses" och istället skapa en ny tabell med alla kurserna i
  tillsammans med en koppling till person-tabellen.

  ta bort kolumn:
  ALTER TABLE person DROP COLUMN courses;

  skapa ny tabell:
  CREATE TABLE courses(
  course_id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT NOT NULL,
  course VARCHAR(20) NOT NULL,
  FOREIGN KEY (student_id) REFERENCES courses(course_id)
  );

  infoga kurser i den nya tabellen:
  INSERT INTO courses (course)
  VALUES ('Math'),
  ('English'),
  ('Chemistry');
 */