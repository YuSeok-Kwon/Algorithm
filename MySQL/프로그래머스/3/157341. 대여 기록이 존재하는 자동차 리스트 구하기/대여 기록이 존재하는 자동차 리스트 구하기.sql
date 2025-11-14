-- 코드를 입력하세요
WITH history AS (
    SELECT DISTINCT
        car_id
    FROM
        car_rental_company_rental_history
    WHERE
        MONTH(start_date) = 10
)

SELECT
    c.car_id
FROM
    car_rental_company_car c
JOIN
    history h ON c.car_id = h.car_id
WHERE
    car_type = "세단"
ORDER BY
    c.car_id DESC
