WITH start AS (
    SELECT
        machine_id
        ,process_id
        , timestamp start_time
    FROM
        Activity
    WHERE
        activity_type = 'start'
),
end AS (
    SELECT
        machine_id
        , process_id
        , timestamp end_time
    FROM
        Activity
    WHERE
        activity_type = 'end'
)

SELECT
    s.machine_id
    , ROUND(AVG(end_time - start_time), 3) processing_time
FROM
    start s
LEFT JOIN
    end e ON s.machine_Id = e.machine_Id
    AND s.process_id = e.process_id
GROUP BY
    machine_id