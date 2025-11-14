-- 코드를 입력하세요
WITH restnum AS (
    SELECT
        ROW_NUMBER() OVER(PARTITION BY food_type ORDER BY favorites DESC) as rownum
        , food_type
        , rest_id
    FROM
        rest_info
)

SELECT
    i.food_type
    , i.rest_id
    , rest_name
    , favorites
FROM
    rest_info i
JOIN
    restnum n ON i.rest_id = n.rest_id
WHERE
    rownum = 1
ORDER BY
    i.food_type DESC