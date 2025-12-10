WITH AllUsers AS (
    SELECT
        COUNT(user_id) AS total
    FROM
        Users
)

SELECT
    contest_id
    , ROUND((COUNT(r.user_id) / total) * 100 , 2) AS percentage
FROM
    Register r
CROSS JOIN
    AllUsers a 
GROUP BY
    contest_id
ORDER BY
    percentage DESC