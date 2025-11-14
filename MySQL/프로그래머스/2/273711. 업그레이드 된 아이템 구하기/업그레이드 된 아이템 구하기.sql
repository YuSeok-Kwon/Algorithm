-- 코드를 작성해주세요
WITH info AS(
    SELECT
        item_id
        , item_name
        , rarity
    FROM
        item_info
    WHERE
        UPPER(rarity) = 'RARE'
)

SELECT
    a.item_id
    , item_name
    , rarity
FROM(
    SELECT
        t.item_id
    FROM
        info i 
    JOIN
        item_tree t ON i.item_id = t.parent_item_id
    ) a
JOIN 
    item_info b on a.item_id = b.item_id
ORDER BY
    a.item_id DESC