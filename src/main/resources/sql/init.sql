CREATE TABLE homework
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    description VARCHAR
);

CREATE TABLE lesson
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    homework_id INT,
    CONSTRAINT fk_homework
        FOREIGN KEY (homework_id)
            REFERENCES homework (id)
);

CREATE TABLE schedule
(
    id         SERIAL PRIMARY KEY,
    name       VARCHAR(255) NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE schedule_lesson
(
    schedule_id INT,
    lesson_id   INT,
    PRIMARY KEY (schedule_id, lesson_id),
    CONSTRAINT fk_schedule
        FOREIGN KEY (schedule_id)
            REFERENCES schedule (id),
    CONSTRAINT fk_lesson
        FOREIGN KEY (lesson_id)
            REFERENCES lesson (id)
);
