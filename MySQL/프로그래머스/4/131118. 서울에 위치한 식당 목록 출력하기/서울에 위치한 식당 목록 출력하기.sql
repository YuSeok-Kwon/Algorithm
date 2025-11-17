-- 코드를 입력하세요
WITH restinfo AS (
    SELECT
        rest_id
        , rest_name
        , food_type
        , favorites
        , address
    FROM
        rest_info
    WHERE
        address LIKE '서울%'
)

SELECT
    i.rest_id
    , rest_name
    , food_type
    , favorites
    , address
    , ROUND(AVG(review_score), 2) AS score
FROM
    restinfo i
JOIN
    rest_review r on i.rest_id = r.rest_id
GROUP BY
    i.rest_id
    , rest_name
    , food_type
    , favorites
    , address
ORDER BY
    score DESC, favorites DESC