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
    payer_type
FROM
    claims_raw
