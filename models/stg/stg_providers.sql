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
    DISTINCT prov_rendering_npi AS provider_id,
    prov_rendering_std_taxonomy AS provider_taxonomy
FROM
    claims_raw
WHERE
    prov_rendering_npi IS NOT NULL
