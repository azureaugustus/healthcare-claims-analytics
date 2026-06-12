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
    DISTINCT hvid AS patient_id,
    patient_gender,
    patient_year_of_birth,
    patient_zip3,
    patient_state
FROM
    claims_raw
