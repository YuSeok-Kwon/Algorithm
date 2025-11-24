WITH discount_rate AS (
    SELECT
        car_type
        , MAX(CASE WHEN duration_type = '7일 이상'
                   THEN CAST(REPLACE(discount_rate, '%', '') AS DECIMAL(5,2)) / 100
                   ELSE NULL END) AS r7
        , MAX(CASE WHEN duration_type = '30일 이상'
                   THEN CAST(REPLACE(discount_rate, '%', '') AS DECIMAL(5,2)) / 100
                   ELSE NULL END) AS r30
        , MAX(CASE WHEN duration_type = '90일 이상'
                   THEN CAST(REPLACE(discount_rate, '%', '') AS DECIMAL(5,2)) / 100
                   ELSE NULL END) AS r90
    FROM
        car_rental_company_discount_plan
    GROUP BY
        car_type
),
only_truck AS (
    SELECT
        h.history_id  -- [추가] 여기서 뽑아야 나중에 씁니다!
        , c.car_type
        , c.daily_fee
        , DATEDIFF(end_date, start_date) + 1 AS days
    FROM
        car_rental_company_car c
    JOIN
        car_rental_company_rental_history h ON c.car_id = h.car_id
    WHERE
        c.car_type = '트럭'
)

SELECT
    t.history_id
    , CAST(
        t.daily_fee * t.days * (1 - COALESCE(
            CASE 
                WHEN t.days >= 90 THEN d.r90
                WHEN t.days >= 30 THEN d.r30
                WHEN t.days >= 7  THEN d.r7
                ELSE 0 
            END, 0)
        ) AS SIGNED
      ) AS fee
FROM
    only_truck t
JOIN
    discount_rate d ON t.car_type = d.car_type
ORDER BY
    fee DESC, history_id DESC