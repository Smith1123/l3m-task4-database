CREATE OR REPLACE FUNCTION students_average_mark (p_name varchar)
RETURNS integer AS $average_mark$
   DECLARE
      average_mark integer;
   BEGIN
   	  SELECT AVG(er.mark) INTO average_mark
	    FROM exam_result er, student s
	   WHERE s.id = er.student_id
	     AND s.name = p_name;
      RETURN avarage_mark;
   END;
   $average_mark$ LANGUAGE plpgsql;
/