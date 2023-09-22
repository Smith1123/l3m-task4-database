WITH RECURSIVE id_sequence AS (
    SELECT 1 as id,
           (SELECT s.id FROM student s ORDER BY random() limit 1) AS student_id,
		   (SELECT s.id FROM subject s ORDER BY random() limit 1) AS subject_id,
		   floor(random() * 5 + 1)::int as mark
    UNION ALL
    SELECT i.id + 1,
			floor(random() * (SELECT max(s.id) FROM student s) + 1)::int as student_id,
			floor(random() * (SELECT max(s.id) FROM subject s) + 1)::int as subject_id,
	        floor(random() * 5 + 1)::int as mark
      FROM id_sequence i
 WHERE id < 1000000
)
INSERT INTO exam_result (id, student_id, subject_id, mark)
	SELECT id, student_id, subject_id, mark FROM id_sequence;