-- 코드를 입력하세요
WITH top_view AS (
    SELECT
        board_id
    FROM
        used_goods_board
    ORDER BY
        views DESC
    LIMIT 1
)

SELECT
    CONCAT('/home/grep/src/', t.board_id, '/', file_id, file_name, file_ext) AS file_path
FROM
    top_view as t
JOIN
    used_goods_file f ON t.board_id = f.board_id
ORDER BY
    file_id DESC

