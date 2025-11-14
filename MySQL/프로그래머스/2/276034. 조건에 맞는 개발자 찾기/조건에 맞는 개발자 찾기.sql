-- 코드를 작성해주세요
SELECT DISTINCT
    ID
    , EMAIL
    , FIRST_NAME
    , LAST_NAME
FROM
    DEVELOPERS d
JOIN (
    SELECT
        CASE name
            WHEN 'Python' THEN code
            WHEN 'C#' THEN code
        END AS code
    FROM
        skillcodes
) s ON d.skill_code & s.code != 0
ORDER BY
    id