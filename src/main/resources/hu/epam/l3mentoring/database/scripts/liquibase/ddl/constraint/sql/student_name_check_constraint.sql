ALTER TABLE student
    ADD CONSTRAINT ch_student_name
        CHECK (name NOT SIMILAR TO '%($|#|@)%');