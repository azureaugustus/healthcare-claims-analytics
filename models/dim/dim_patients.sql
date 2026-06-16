WITH patients AS (
    SELECT
        *
    FROM
        {{ ref('stg_patients') }}
)
SELECT
    DISTINCT patient_id,
    patient_gender,
    CASE
        WHEN patient_gender = 'M' THEN 'Male'
        WHEN patient_gender = 'F' THEN 'Female'
        ELSE 'Unknown'
    END AS patient_gender_desc,
    patient_year_of_birth,
    YEAR(CURRENT_DATE()) - patient_year_of_birth AS estimated_age,
    CASE
        WHEN YEAR(CURRENT_DATE()) - patient_year_of_birth < 18 THEN 'Child'
        WHEN YEAR(CURRENT_DATE()) - patient_year_of_birth BETWEEN 18
        AND 64 THEN 'Adult'
        ELSE 'Senior'END AS age_group,
        patient_zip3,
        patient_state
        FROM
            patients
