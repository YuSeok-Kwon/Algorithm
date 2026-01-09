SELECT
    product_id
    , year AS first_year
    , quantity
    , price
FROM (
    SELECT
        *
        , RANK() OVER(PARTITION BY product_id ORDER BY year ASC) rnk
    FROM
        Sales
) a
WHERE
    rnk = 1