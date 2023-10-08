CREATE INDEX idx_gin_student_surname ON student USING GIN (surname);
CREATE INDEX idx_gin_subject_subject_name ON subject USING GIN (subject_name);