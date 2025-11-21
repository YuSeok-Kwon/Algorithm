WITH RECURSIVE hours AS (
    SELECT 0 AS hour
    UNION ALL
    
    SELECT hour + 1
    FROM hours
    WHERE hour < 23 
 )
 
SELECT
    hour
    , COUNT(animal_id) AS count
FROM
    hours h
LEFT JOIN
    animal_outs o ON HOUR(o.datetime) = h.hour
GROUP BY
    hour
ORDER BY
    hour