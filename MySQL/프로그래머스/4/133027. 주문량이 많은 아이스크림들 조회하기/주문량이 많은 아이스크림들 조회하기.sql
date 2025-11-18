-- 코드를 입력하세요
WITH totalorder AS (
    SELECT
        h.flavor
        , h.total_order + SUM(j.total_order) AS total
    FROM
        first_half h
    JOIN
        july j on j.flavor = h.flavor
    GROUP BY
        h.flavor
)

SELECT
    flavor
FROM
    totalorder
ORDER BY
    total DESC
LIMIT 3
