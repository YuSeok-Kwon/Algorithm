-- 코드를 입력하세요
WITH duration AS (
    SELECT
        car_id
        , DATEDIFF(end_date, start_date) + 1 AS duration
    FROM
        car_rental_company_rental_history )

SELECT
    car_id
    , ROUND(AVG(duration), 1) average_duration
FROM
    duration
GROUP BY
     car_id
HAVING
    AVG(duration) >= 7
ORDER BY
    average_duration DESC, car_id DESC