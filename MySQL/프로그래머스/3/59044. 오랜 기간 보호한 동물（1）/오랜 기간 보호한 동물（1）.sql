-- 코드를 입력하세요
SELECT
    ai.name
    , ai.datetime
FROM
    ANIMAL_INS ai
LEFT JOIN
    ANIMAL_OUTS ao ON ai.animal_id = ao.animal_id
WHERE
    ao.animal_id IS NULL
ORDER BY
    ai.datetime
LIMIT 3