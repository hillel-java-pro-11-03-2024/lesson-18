-- Отримання всіх записів Homework
SELECT *
FROM homework;


-- Отримання всіх записів Lesson, включаючи дані Homework
SELECT lesson.id     AS lesson_id,
       lesson.name   AS lesson_name,
       lesson.updated_at,
       homework.id   AS homework_id,
       homework.name AS homework_name,
       homework.description
FROM lesson
         LEFT JOIN homework ON lesson.homework_id = homework.id;


-- Отримання всіх записів Lesson (включаючи дані Homework) відсортовані за часом оновлення
SELECT lesson.id     AS lesson_id,
       lesson.name   AS lesson_name,
       lesson.updated_at,
       homework.id   AS homework_id,
       homework.name AS homework_name,
       homework.description
FROM lesson
         LEFT JOIN homework ON lesson.homework_id = homework.id
ORDER BY lesson.updated_at;


-- Отримання всіх записів Schedule, включаючи дані Lesson
SELECT schedule.id         AS schedule_id,
       schedule.name       AS schedule_name,
       schedule.updated_at AS schedule_updated_at,
       lesson.id           AS lesson_id,
       lesson.name         AS lesson_name,
       lesson.updated_at   AS lesson_updated_at
FROM schedule
         LEFT JOIN schedule_lesson ON schedule.id = schedule_lesson.schedule_id
         LEFT JOIN lesson ON schedule_lesson.lesson_id = lesson.id;


-- Отримання кількості Lesson для кожного Schedule
SELECT schedule.id                      AS schedule_id,
       schedule.name                    AS schedule_name,
       COUNT(schedule_lesson.lesson_id) AS lesson_count
FROM schedule
         LEFT JOIN schedule_lesson ON schedule.id = schedule_lesson.schedule_id
GROUP BY schedule.id;
