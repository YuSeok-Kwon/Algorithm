-- 코드를 입력하세요
SELECT
    car_type
    , SUM(CASE WHEN options REGEXP '통풍시트|열선시트|가죽시트' THEN 1 ELSE 0 END) AS cars
FROM
    car_rental_company_car
GROUP BY
    car_type
ORDER BY
    car_type