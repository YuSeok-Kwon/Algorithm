-- 코드를 입력하세요
SELECT
    board_id
    , writer_id
    , title
    , price
    , CASE status
        WHEN 'RESERVED' THEN '예약중'
        WHEN 'SALE' THEN '판매중'
        ELSE '거래완료'
    END AS status
FROM
    used_goods_board
WHERE
    created_date = '2022-10-05'
ORDER BY
    board_id DESC