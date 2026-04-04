WITH StuwithSub AS (
    SELECT
        st.student_id
        , st.student_name
        , su.subject_name
    FROM
        Students st
    CROSS JOIN
        Subjects su
)

SELECT
    sws.student_id
    , sws.student_name
    , sws.subject_name
    , COUNT(ex.student_id) attended_exams
FROM
    StuwithSub sws
LEFT JOIN
    Examinations ex ON sws.student_id = ex.student_id
    AND sws.subject_name = ex.subject_name
GROUP BY
    sws.student_id, sws.subject_name
ORDER BY
    student_id, subject_name