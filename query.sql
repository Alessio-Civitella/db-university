SELECT * FROM db_university.students
WHERE year(date_of_birth) = 1990;

SELECT * FROM db_university.courses
WHERE cfu > 10

SELECT * 
FROM db_university.students
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 30;

SELECT * FROM db_university.courses
WHERE year = 1 AND period LIKE 'I sem%'

SELECT * FROM db_university.exams
WHERE hour > '14:00:00' AND date = '2020-06-20'

SELECT * FROM db_university.degrees
WHERE LIKE 'mag%'

SELECT COUNT() FROM db_university.departments

SELECT FROM db_university.teachers
WHERE phone IS NULL