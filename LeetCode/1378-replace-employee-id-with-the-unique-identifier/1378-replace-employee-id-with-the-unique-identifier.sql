SELECT
    COALESCE(unique_id, null) AS unique_id
    , name
FROM
    Employees e
LEFT JOIN
    EmployeeUNI eu ON e.id = eu.id
ORDER BY
    unique_id