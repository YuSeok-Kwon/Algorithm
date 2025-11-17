WITH Milk_Yogurt_List AS (
    SELECT
        cart_id,
        name
    FROM
        cart_products
    WHERE
        name IN ('Milk', 'Yogurt') 
)

SELECT
    cart_id
FROM
    Milk_Yogurt_List
GROUP BY
    cart_id
HAVING
    COUNT(DISTINCT name) = 2; 