CREATE OR REPLACE FUNCTION fill_student_progress_snapshot()
  RETURNS TRIGGER
  LANGUAGE PLPGSQL
  AS
$$
DECLARE
    student_name    varchar;
    student_surname varchar;
    subject_name    varchar;
BEGIN
    SELECT s.name, s.surname INTO student_name, student_surname
      FROM student s
     WHERE s.id = NEW.student_id;
     SELECT s.subject_name INTO subject_name FROM subject s WHERE s.id = NEW.subject_id;
    INSERT INTO student_progress_snapshot (id, student_name, student_surname, subject_name, mark)
        VALUES (default, student_name, student_surname, subject_name, NEW.mark);
	RETURN NEW;
END;
$$
/