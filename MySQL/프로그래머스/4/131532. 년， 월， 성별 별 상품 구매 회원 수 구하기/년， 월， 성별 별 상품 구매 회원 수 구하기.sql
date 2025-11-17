-- 코드를 입력하세요
WITH sale AS (
    SELECT DISTINCT
        YEAR(sales_date) AS year
        , MONTH(sales_date) AS month
        , user_id
    FROM
        online_sale
    ORDER BY
        month, user_id
)

SELECT
    year
    , month
    , gender
    , COUNT(s.user_id) AS users
FROM
    sale s
JOIN
    user_info i ON s.user_id = i.user_id
WHERE
    gender IS NOT NULL
GROUP BY
    year, month, gender
ORDER BY
    year, month, gender

