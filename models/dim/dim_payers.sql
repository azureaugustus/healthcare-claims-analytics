WITH payers AS (
    SELECT
        *
    FROM
        {{ ref('stg_payers') }}
)
SELECT
    payer_type AS payer_id,
    payer_type
FROM
    payers
