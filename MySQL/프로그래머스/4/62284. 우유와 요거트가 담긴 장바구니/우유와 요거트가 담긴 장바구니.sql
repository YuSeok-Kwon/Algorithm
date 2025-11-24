-- 코드를 입력하세요
WITH MY as (
SELECT
    cart_id
    , name
FROM
    cart_products
WHERE
    name in ('Milk','Yogurt')
)

SELECT
    cart_id
FROM
    my
GROUP BY
    cart_id
HAVING
    COUNT(DISTINCT name) = 2
ORDER BY
    cart_id