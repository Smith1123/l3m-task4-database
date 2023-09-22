WITH RECURSIVE id_sequence AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
      FROM id_sequence
     WHERE n < 1000
), incremented_ids AS (
    SELECT n AS id
    FROM id_sequence
), generated_data AS (
    SELECT i.id,
           'Subject' || LPAD(CAST(i.id AS text), 3, '0') AS subject_name,
           'John Doe' || LPAD(CAST(i.id AS text), 3, '0') AS tutor
      FROM incremented_ids i
)
INSERT INTO subject (id, subject_name, tutor)
    SELECT id, subject_name, tutor
      FROM generated_data;
