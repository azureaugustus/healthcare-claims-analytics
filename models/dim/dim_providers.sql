WITH providers AS (
    SELECT
        *
    FROM
        {{ ref('stg_providers') }}
),
taxonomy AS (
    SELECT
        *
    FROM
        {{ ref('stg_provider_taxonomy') }}
)
SELECT
    p.provider_id,
    p.provider_taxonomy,
    t.classification,
    t.specialization,
    t.display_name
FROM
    providers p
LEFT JOIN taxonomy t ON p.provider_taxonomy = t.provider_taxonomy
