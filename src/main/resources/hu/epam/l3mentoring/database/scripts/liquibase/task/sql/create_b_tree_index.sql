CREATE INDEX idx_bt_student_surname ON student USING BTREE (surname);
CREATE INDEX idx_bt_subject_subject_name ON subject USING BTREE (subject_name);
CREATE INDEX idx_bt_exam_result_subject_id ON exam_result USING BTREE (subject_id);
CREATE INDEX idx_bt_exam_result_student_id ON exam_result USING BTREE (student_id);