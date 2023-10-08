CREATE OR REPLACE PROCEDURE explain_analyze_student_with_marks_surname_partial_match_query(
	IN parameter_string character varying
)
    LANGUAGE 'plpgsql'
    AS
$$
DECLARE
	rec record;
	next_id int;
	next_call_id int;
BEGIN

    SELECT COALESCE(MAX(call_id) + 1, 1) INTO next_call_id
      FROM plan;
    FOR rec IN EXECUTE
        'EXPLAIN ANALYZE SELECT st.id, st.name, st.surname, su.subject_name, er.mark ' ||
                          'FROM student st, subject su, exam_result er ' ||
                         'WHERE st.id = er.student_id ' ||
                           'AND su.id = er.subject_id ' ||
                           'AND st.surname::text LIKE ''%' || parameter_string || '%'''
    LOOP
        SELECT COALESCE(MAX(id) + 1, 1) INTO next_id FROM plan;
        INSERT INTO plan
        SELECT next_id,
               'explain_analyze_student_with_marks_surname_partial_match_query',
               next_call_id,
               parameter_string,
               rec."QUERY PLAN";
    END LOOP;
END;
$$
/