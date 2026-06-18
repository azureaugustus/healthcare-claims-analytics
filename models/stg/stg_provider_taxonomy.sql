WITH taxonomy AS (
    SELECT
        *
    FROM
        {{ source(
            'bronze',
            'provider_taxonomy'
        ) }}
)

SELECT
    code AS provider_taxonomy,
    classification,
    specialization,
    display_name
FROM taxonomy