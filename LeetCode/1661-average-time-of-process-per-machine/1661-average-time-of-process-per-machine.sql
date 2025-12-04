WITH start AS (
    SELECT
        machine_id
        , timestamp
    FROM
        Activity
    WHERE
        activity_type = 'start'
) ,
end AS (
    SELECT
        machine_id
        , timestamp
    FROM
        Activity
    WHERE
        activity_type = 'end'
) 

SELECT
    s.machine_id 
    , ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
FROM
    start s
LEFT JOIN
    end e ON s.machine_id = e.machine_id
GROUP BY
    s.machine_id