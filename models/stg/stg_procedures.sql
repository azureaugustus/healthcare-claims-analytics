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
    procedure_code,
    procedure_code_qual
FROM
    claims_raw
WHERE
    procedure_code IS NOT NULL
