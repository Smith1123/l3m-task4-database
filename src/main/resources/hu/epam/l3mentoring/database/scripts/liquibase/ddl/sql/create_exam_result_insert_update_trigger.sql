CREATE OR REPLACE TRIGGER tr_i_u_exam_result
   BEFORE INSERT OR UPDATE
   ON exam_result
   FOR EACH ROW
       EXECUTE PROCEDURE fill_student_progress_snapshot();