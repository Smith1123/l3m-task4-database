CREATE OR REPLACE FUNCTION fill_updated_datetime()
  RETURNS TRIGGER
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
    --UPDATE student SET updated_datetime = now() WHERE id = NEW.id;
    NEW.updated_datetime := now();
	RETURN NEW;
END;
$$
/