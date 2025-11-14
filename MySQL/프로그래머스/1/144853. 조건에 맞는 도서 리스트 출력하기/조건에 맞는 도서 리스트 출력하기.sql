-- 코드를 입력하세요
SELECT
    book_id
    , DATE_FORMAT(PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
FROM
    book
WHERE
   YEAR(PUBLISHED_DATE) = '2021'
   AND category = '인문'
ORDER BY
    PUBLISHED_DATE