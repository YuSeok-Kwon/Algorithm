-- 1. 11월에 대여 기록이 있는(빌릴 수 없는) 차의 ID를 먼저 구합니다.
WITH Unavailable_Cars AS (
    SELECT car_id
    FROM car_rental_company_rental_history
    WHERE start_date <= '2022-11-30' AND end_date >= '2022-11-01'
)

SELECT 
    c.car_id,
    c.car_type,
    -- 3. 요금 계산 (반올림 및 정수 처리)
    ROUND(c.daily_fee * 30 * (100 - p.discount_rate) / 100, 0) AS fee
FROM 
    car_rental_company_car c
JOIN 
    car_rental_company_discount_plan p 
    ON c.car_type = p.car_type
WHERE 
    c.car_type IN ('세단', 'SUV') 
    AND p.duration_type = '30일 이상'
    -- 2. 앞서 구한 '빌릴 수 없는 차' 목록에 없는 차만 선택 (NOT IN)
    AND c.car_id NOT IN (SELECT car_id FROM Unavailable_Cars)
HAVING 
    -- 4. 계산된 금액(fee)으로 필터링 (HAVING 절 사용 가능)
    fee >= 500000 AND fee < 2000000
ORDER BY 
    fee DESC, 
    c.car_type ASC, 
    c.car_id DESC;