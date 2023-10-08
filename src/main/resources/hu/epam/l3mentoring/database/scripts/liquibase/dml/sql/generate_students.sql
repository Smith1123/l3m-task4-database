WITH RECURSIVE id_sequence AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
      FROM id_sequence
     WHERE n < 100000
), incremented_ids AS (
    SELECT n AS id
    FROM id_sequence
), generated_data AS (
    SELECT i.id,
           'John' || LPAD(CAST(i.id AS text), 5, '0') AS name,
           to_json('Doe' || LPAD(CAST(i.id AS text), 5, '0')) AS surname,
           DATE '2001-01-01' + (i.id * INTERVAL '1 day') AS date_of_birth,
           '555-123-456' || LPAD(CAST(i.id AS text), 5, '0') AS phone_number,
           'Skill' || LPAD(CAST(i.id AS text), 3, '0') AS primary_skill
      FROM incremented_ids i
)
INSERT INTO student
    (id, name, surname, date_of_birth, phone_number, primary_skill)
    SELECT id, name, surname, date_of_birth, phone_number, primary_skill
      FROM generated_data;
