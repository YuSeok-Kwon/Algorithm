WITH rental_info AS (
    SELECT
        h.history_id
        , c.car_type
        , c.daily_fee
        , DATEDIFF(h.end_date, h.start_date) + 1 AS duration
        , CASE
            WHEN DATEDIFF(h.end_date, h.start_date) + 1 >= 90 THEN '90일 이상'
            WHEN DATEDIFF(h.end_date, h.start_date) + 1 >= 30 THEN '30일 이상'
            WHEN DATEDIFF(h.end_date, h.start_date) + 1 >= 7  THEN '7일 이상'
            ELSE NULL
        END AS duration_type
    FROM
        car_rental_company_rental_history h
    JOIN
        car_rental_company_car c ON h.car_id = c.car_id
    WHERE
        c.car_type = '트럭'
)

SELECT
    r.history_id
    , ROUND(
        r.daily_fee * r.duration * (100 - COALESCE(p.discount_rate, 0)) / 100
      , 0) AS FEE
FROM
    rental_info r
LEFT JOIN
    car_rental_company_discount_plan p
    ON r.duration_type = p.duration_type
    AND r.car_type = p.car_type
ORDER BY
    FEE DESC
    , r.history_id DESC;