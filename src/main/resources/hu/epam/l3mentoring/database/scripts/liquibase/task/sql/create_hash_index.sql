CREATE INDEX idx_h_student_surname ON student USING HASH (surname);
CREATE INDEX idx_h_subject_subject_name ON subject USING HASH (subject_name);
CREATE INDEX idx_h_exam_result_subject_id ON exam_result USING HASH (subject_id);
CREATE INDEX idx_h_exam_result_student_id ON exam_result USING HASH (student_id);