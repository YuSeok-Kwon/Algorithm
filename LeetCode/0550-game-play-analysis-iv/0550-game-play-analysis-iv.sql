WITH FirstLogin AS(
    SELECT
        player_id
        , MIN(event_date) first
    FROM
        Activity
    GROUP BY
        player_id
)

SELECT
   ROUND(COUNT(a.player_id) / COUNT(f.player_id), 2) fraction
FROM
    FirstLogin f
LEFT JOIN
    Activity a
    ON f.player_id = a.player_id
    AND a.event_date = DATE_ADD(f.first, INTERVAL 1 DAY)