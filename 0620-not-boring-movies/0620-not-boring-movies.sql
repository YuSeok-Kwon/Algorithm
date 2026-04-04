SELECT
    id
    , movie
    , description
    , rating
FROM
    Cinema
WHERE
    description NOT IN ('boring')
    AND id % 2 = 1
ORDER BY
    rating DESC