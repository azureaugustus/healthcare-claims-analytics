WITH providers AS (
    SELECT
        *
    FROM
        {{ ref('stg_providers') }}
)
SELECT
    provider_id,
    provider_taxonomy
FROM
    providers
