CREATE OR REPLACE FUNCTION get_red_zone_students()
RETURNS SETOF student AS $$
SELECT s.* FROM student s WHERE s.id IN
	(SELECT er.student_id
	   FROM exam_result er
	  WHERE er.mark <= 3
   GROUP BY er.student_id HAVING COUNT(er.student_id) >= 2);
$$ LANGUAGE sql;
/