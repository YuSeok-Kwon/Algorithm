-- 코드를 입력하세요
WITH join2021 AS (
    SELECT 
        COUNT(DISTINCT user_id) AS totalcnt
    FROM
        user_info
    WHERE
        YEAR(joined) = 2021
), 
purchased2021 AS (
    SELECT
        YEAR(sales_date) AS year
        , MONTH(sales_date) AS month
        , COUNT(DISTINCT o.user_id) AS purchased_users
    FROM
        online_sale o
    JOIN
        user_info u ON u.user_id = o.user_id
    WHERE
        YEAR(u.joined) = 2021
    GROUP BY
        year, month
)

SELECT
    year
    , month
    , purchased_users
    , ROUND(purchased_users / totalcnt, 1) AS purchased_ratio
FROM
    purchased2021
CROSS JOIN
    join2021
ORDER BY
    year, month