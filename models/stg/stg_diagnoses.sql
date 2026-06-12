WITH claims_raw AS (
    SELECT
        *
    FROM
        {{ source(
            'bronze',
            'claims_raw'
        ) }}
)
SELECT
    DISTINCT diagnosis_code,
    diagnosis_code_qual
FROM
    claims_raw
WHERE
    diagnosis_code IS NOT NULL
