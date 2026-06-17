WITH payers AS (
    SELECT
        *
    FROM
        {{ ref('stg_payers') }}
)
SELECT
    DISTINCT payer_type AS payer_id,
    payer_type
FROM
    payers
WHERE
    payer_type IS NOT NULL
