-- 코드를 입력하세요
WITH records AS (
    SELECT
        MONTH(start_date) AS month
        , car_id
        , COUNT(history_id) AS cnt
    FROM
        car_rental_company_rental_history
    WHERE
        DATE(start_date) >= '2022-08-01'
        AND DATE(start_date) < '2022-11-01'
    GROUP BY
        MONTH(start_date), car_id
)

SELECT
    month, car_id, cnt
FROM
    records
WHERE
    car_id IN (
        SELECT
            car_id
        FROM
            records
        GROUP BY
            car_id
        HAVING
            SUM(cnt) >= 5
    )
ORDER BY
    month, car_id DESC