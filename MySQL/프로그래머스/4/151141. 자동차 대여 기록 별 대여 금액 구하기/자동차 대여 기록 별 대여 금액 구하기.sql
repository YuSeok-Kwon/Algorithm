-- 코드를 입력하세요
WITH discount AS (
    SELECT
         c.car_type
        , history_id
        , daily_fee
        , DATEDIFF(end_date, start_date) + 1 AS diffdate
        , CASE
            WHEN DATEDIFF(end_date, start_date) + 1 >= 90 THEN '90일 이상'
            WHEN DATEDIFF(end_date, start_date) + 1 >= 30 THEN '30일 이상'
            WHEN DATEDIFF(end_date, start_date) + 1 >= 7 THEN '7일 이상'
            ELSE '할인 없음'
        END AS duration
    FROM
        car_rental_company_car c
    JOIN
        car_rental_company_rental_history h ON c.car_id = h.car_id
    WHERE
        c.car_type = '트럭'
)

SELECT
    history_id
    , ROUND(daily_fee * diffdate * (100 - COALESCE(p.discount_rate, 0)) * 0.01, 0) AS fee
FROM
    discount d
LEFT JOIN
    car_rental_company_discount_plan p
ON 
    p.car_type = d.car_type
    AND p.duration_type = d.duration
ORDER BY
    fee DESC, history_id DESC