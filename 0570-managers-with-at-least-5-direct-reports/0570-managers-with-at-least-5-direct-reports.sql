SELECT
    name
FROM
    Employee e1
WHERE
    5 <= (SELECT COUNT(e2.managerId)
        FROM Employee e2
        WHERE e1.id = e2.managerId)