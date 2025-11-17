-- 코드를 입력하세요
WITH appo AS (
    SELECT
         apnt_no
        , pt_no
        , mddr_id
        , apnt_ymd
    FROM
        appointment
    WHERE
        DATE(apnt_ymd) = '2022-04-13'
        AND (apnt_cncl_yn = 'N')
        AND (mcdp_cd = 'CS')
)

SELECT
    apnt_no
    , p.pt_name
    , p.pt_no
    , d.mcdp_cd
    , d.dr_name
    , a.apnt_ymd
FROM
    appo a 
JOIN
    patient p ON a.pt_no = p.pt_no
JOIN
    doctor d ON a.mddr_id = d.dr_id
ORDER BY
    a.apnt_ymd