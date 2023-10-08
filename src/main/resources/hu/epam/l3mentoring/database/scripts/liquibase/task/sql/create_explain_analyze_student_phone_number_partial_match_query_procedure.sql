CREATE OR REPLACE PROCEDURE explain_analyze_student_phone_number_partial_match_query(
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
        'EXPLAIN ANALYZE SELECT * FROM student WHERE phone_number LIKE ''%' || parameter_string || '%'''
    LOOP
        SELECT COALESCE(MAX(id) + 1, 1) INTO next_id FROM plan;
        INSERT INTO plan
        SELECT next_id,
               'explain_analyze_student_phone_number_partial_match_query',
               next_call_id,
               parameter_string,
               rec."QUERY PLAN";
    END LOOP;
END;
$$
/