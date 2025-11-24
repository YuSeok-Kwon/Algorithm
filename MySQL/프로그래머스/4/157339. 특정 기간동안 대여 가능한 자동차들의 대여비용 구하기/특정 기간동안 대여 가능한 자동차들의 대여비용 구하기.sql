-- 코드를 입력하세요
WITH unavailable AS (
    SELECT
        car_id
    FROM
        car_rental_company_rental_history
    WHERE
        start_date <= '2022-11-30'
        AND end_date >= '2022-11-01'
),
available AS (
    SELECT
        c.car_id
        , c.car_type
        , c.daily_fee
    FROM
        car_rental_company_car c
    LEFT JOIN
        unavailable u ON c.car_id = u.car_id
    WHERE
        u.car_id IS NULL
        AND car_type IN ('세단','SUV')
)

SELECT
    car_id
    , a.car_type
    , ROUND(daily_fee * 30 * (100 - discount_rate) * 0.01, 0) AS fee
FROM
    available a
JOIN
    car_rental_company_discount_plan p ON a.car_type = p.car_type
WHERE
    duration_type = '30일 이상'
    AND (ROUND(daily_fee * 30 * (100 - discount_rate) * 0.01, 0) >= 500000
    AND ROUND(daily_fee * 30 * (100 - discount_rate) * 0.01, 0) < 2000000)
ORDER BY
    fee DESC, car_type, car_id DESC