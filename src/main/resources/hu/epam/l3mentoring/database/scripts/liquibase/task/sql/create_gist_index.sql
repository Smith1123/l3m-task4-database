CREATE INDEX idx_gist_student_surname ON student USING GIST (surname);
CREATE INDEX idx_gist_subject_subject_name ON subject USING GIST (subject_name);
CREATE INDEX idx_gist_exam_result_subject_id ON exam_result USING GIST (subject_id);
CREATE INDEX idx_gist_exam_result_student_id ON exam_result USING GIST (student_id);