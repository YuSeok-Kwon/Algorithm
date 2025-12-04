WITH allSub AS (
    SELECT
    stu.student_id
    , stu.student_name
    , sub.subject_name
FROM
    Students stu
CROSS JOIN
    Subjects sub
) ,
examCnt AS (
    SELECT
        student_id
        , subject_name
        , COUNT(subject_name) AS attended_exams
    FROM
        Examinations
    GROUP BY
        student_id, subject_name
)

SELECT
    a.student_id
    , a.student_name
    , a.subject_name
    , COALESCE(attended_exams, 0) AS attended_exams
FROM
    allSub a
LEFT JOIN
    examCnt e ON a.student_id = e.student_id AND a.subject_name = e.subject_name
ORDER BY
    a.student_id, a.subject_name