WITH total AS (
    SELECT
        user_id
        , COALESCE(COUNT(*), 0) AS total
    FROM
        Confirmations
    GROUP BY
        user_id
),
confirmed AS (
    SELECT
        user_id
        , COALESCE(COUNT(*), 0) AS confirmed
    FROM
        Confirmations
    WHERE
        action IN ('confirmed')
    GROUP BY
        user_id
)

SELECT
    s.user_id
    , ROUND(COALESCE(confirmed / total, 0), 2) AS confirmation_rate
FROM
    Signups s
LEFT JOIN
    total AS t ON s.user_id = t.user_id
LEFT JOIN
    confirmed AS c ON s.user_id = c.user_id