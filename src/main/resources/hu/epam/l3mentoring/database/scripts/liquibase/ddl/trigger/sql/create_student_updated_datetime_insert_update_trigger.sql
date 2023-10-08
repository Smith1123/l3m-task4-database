CREATE OR REPLACE TRIGGER tr_student_updated_datetime
   BEFORE INSERT OR UPDATE
   ON student
   FOR EACH ROW
       EXECUTE PROCEDURE fill_updated_datetime();