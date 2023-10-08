CREATE OR REPLACE FUNCTION my_to_json(text_parameter text)
  RETURNS json
AS
$BODY$
    SELECT to_json(text_parameter);
$BODY$
LANGUAGE sql
IMMUTABLE;
/