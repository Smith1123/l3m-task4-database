CREATE OR REPLACE FUNCTION fill_created_datetime()
  RETURNS TRIGGER
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
    --UPDATE student SET updated_datetime = now() WHERE id = NEW.id;
    NEW.created_datetime := now();
	RETURN NEW;
END;
$$
/