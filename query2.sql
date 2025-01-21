-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT students.*
FROM students
JOIN degrees ON students.degree_id = degrees.id
WHERE degrees.name = 'Economia';

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT degrees.*
FROM degrees
JOIN departments ON degrees.department_id = departments.id
WHERE degrees.level = 'Magistrale' AND departments.name = 'Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT courses.*
FROM courses
JOIN course_teacher ON courses.id = course_teacher.course_id
WHERE course_teacher.teacher_id = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT students.name, students.surname, degrees.name AS degree_name, departments.name AS department_name
FROM students
JOIN degrees ON students.degree_id = degrees.id
JOIN departments ON degrees.department_id = departments.id
ORDER BY students.surname, students.name;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT degrees.name AS degree_name, courses.name AS course_name, CONCAT(teachers.name, ' ', teachers.surname) AS teacher_name
FROM degrees
JOIN courses ON degrees.id = courses.degree_id
JOIN course_teacher ON courses.id = course_teacher.course_id
JOIN teachers ON course_teacher.teacher_id = teachers.id;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT teachers.*
FROM teachers
JOIN course_teacher ON teachers.id = course_teacher.teacher_id
JOIN courses ON course_teacher.course_id = courses.id
JOIN degrees ON courses.degree_id = degrees.id
WHERE degrees.department_id = 54;

-- BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
SELECT students.id AS student_id, students.name, students.surname, exams.id AS exam_id, COUNT(vote.exam_id) AS attempts
FROM students
JOIN vote ON students.id = vote.student_id
JOIN exams ON vote.exam_id = exams.id
GROUP BY students.id, exams.id;
