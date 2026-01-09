SELECT
    product_id
    , year first_year
    , quantity
    , price
FROM
    Sales
WHERE
    (product_id, year) IN (
        SELECT
            product_id
            , year
        FROM
            Sales
        WHERE
            year = MIN(year)
    )