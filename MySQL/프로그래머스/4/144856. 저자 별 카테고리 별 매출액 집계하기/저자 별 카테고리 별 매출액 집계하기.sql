-- 코드를 입력하세요
WITH book_author AS (
    SELECT
        b.book_id
        , category
        , price
        , a.author_id
        , a.author_name
    FROM
        book b
    JOIN
        author a ON b.author_id = a.author_id
)

SELECT
    a.author_id
    , author_name
    , category
    , SUM(price * sales) AS sales
FROM
    book_sales s
JOIN
    book_author a ON s.book_id = a.book_id
WHERE
    DATE(sales_date) >= '2022-01-01'
    AND DATE(sales_date) < '2022-02-01'
GROUP BY
    author_name
    , category
ORDER BY
    a.author_id, category DESC