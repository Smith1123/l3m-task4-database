CREATE OR REPLACE TRIGGER tr_student_created_datetime
   BEFORE INSERT
   ON student
   FOR EACH ROW
       EXECUTE PROCEDURE fill_created_datetime();