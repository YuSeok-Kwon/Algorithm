SELECT
    name
FROM
    employee e1
WHERE
    5 <= (
        SELECT
            COUNT(e2.managerId)
        FROM
            employee e2
        WHERE
            e1.id = e2.managerId
    )
