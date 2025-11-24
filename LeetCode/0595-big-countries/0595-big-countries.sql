SELECT
    name
    , population
    , w.area
FROM
    World w
WHERE
    w.area >= 3000000
    OR population >= 25000000
ORDER BY
    name