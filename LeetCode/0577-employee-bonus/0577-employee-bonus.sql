SELECT
    name
    , bonus
FROM
    Employee e
LEFT JOIN 
    Bonus b ON e.empid = b.empid
WHERE
    bonus IS NULL
    OR bonus < 1000