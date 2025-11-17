-- 코드를 입력하세요
WITH hostcnt AS (
    SELECT
        host_id
        , COUNT(*) AS cnt
    FROM
        places
    GROUP BY
        host_id
)

SELECT
    id
    , name
    , p.host_id
FROM
    places p
JOIN
    hostcnt h ON p.host_id = h.host_id
WHERE
    h.cnt >= 2