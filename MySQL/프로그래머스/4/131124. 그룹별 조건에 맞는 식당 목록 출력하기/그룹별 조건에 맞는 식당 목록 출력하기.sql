-- 코드를 입력하세요
WITH review_rank AS (
    SELECT
        member_id
        , RANK() OVER(ORDER BY COUNT(member_id) DESC) AS ran
    FROM
        rest_review
    GROUP BY
        member_id
)

SELECT
    p.member_name
    , r.review_text
    , SUBSTR(r.review_date,1,10) AS review_date
FROM
    member_profile p
JOIN
    rest_review r ON p.member_id = r.member_id
JOIN
    review_rank rk ON p.member_id = rk.member_id
WHERE
    rk.ran = 1
ORDER BY
    review_date, review_text

    