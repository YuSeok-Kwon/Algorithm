SELECT
    r.contest_id
    , ROUND((COUNT(r.user_id) / totalcnt) * 100, 2) percentage
FROM (
    SELECT
        COUNT(user_id) totalcnt
    FROM
        Users
) as u 
Cross JOIN
    Register r
GROUP BY
    r.contest_id
ORDER BY
    percentage DESC, r.contest_id