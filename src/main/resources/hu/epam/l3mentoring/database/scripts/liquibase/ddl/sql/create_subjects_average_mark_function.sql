CREATE OR REPLACE FUNCTION subjects_average_mark (p_subject_name varchar)
RETURNS integer AS $average_mark$
   DECLARE
      average_mark integer;
   BEGIN
   	  SELECT AVG(er.mark) INTO average_mark
	    FROM exam_result er, subject s
	   WHERE s.id = er.subject_id
	     AND s.subject_name = p_subject_name;
      RETURN avarage_mark;
   END;
   $average_mark$ LANGUAGE plpgsql;