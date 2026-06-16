WITH diagnoses AS (
    SELECT
        *
    FROM
        {{ ref('stg_diagnoses') }}
)
SELECT
    diagnosis_code,
    diagnosis_code_qual
FROM
    diagnoses
