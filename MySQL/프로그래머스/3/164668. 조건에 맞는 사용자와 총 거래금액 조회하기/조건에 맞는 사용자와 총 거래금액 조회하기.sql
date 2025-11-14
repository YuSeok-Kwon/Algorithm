-- 코드를 입력하세요
SELECT
    ugu.USER_ID,
    ugu.NICKNAME,
    SUM(ugb.PRICE) AS TOTAL_SALES
FROM
    USED_GOODS_USER ugu
    JOIN USED_GOODS_BOARD ugb ON ugu.USER_ID = ugb.WRITER_ID
WHERE
    ugb.STATUS = 'DONE'
GROUP BY
    ugu.USER_ID,
    ugu.NICKNAME
HAVING
    700000 <= SUM(ugb.price)
ORDER BY
     SUM(ugb.PRICE)