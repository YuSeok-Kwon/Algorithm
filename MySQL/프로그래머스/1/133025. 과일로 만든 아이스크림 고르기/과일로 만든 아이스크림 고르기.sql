-- 코드를 입력하세요
SELECT
    h.flavor
FROM
    first_half h
JOIN
    icecream_info i ON h.flavor = i.flavor
WHERE
    h.total_order > 3000
    AND i.INGREDIENT_TYPE = 'fruit_based'