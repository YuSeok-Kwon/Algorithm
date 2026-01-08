SELECT
    activity_date day
    , COUNT(DISTINCT user_id) AS active_users
FROM
    Activity
WHERE
    activity_date < '2019-07-28'
    AND activity_date > DATE_ADD('2019-07-27', INTERVAL -30 DAY)
GROUP BY
    activity_date