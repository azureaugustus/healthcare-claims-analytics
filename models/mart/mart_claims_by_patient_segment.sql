WITH claim_lines AS (
    SELECT
        *
    FROM
        {{ ref('fct_claim_lines') }}
),
patients AS (
    SELECT
        *
    FROM
        {{ ref('dim_patients') }}
), payers AS (
    SELECT
        *
    FROM
        {{ ref('dim_payers') }}
)
SELECT
    p.age_group,
    p.patient_gender_desc,
    py.payer_type,
    COUNT(
        C.claim_id
    ) AS claim_count,
    SUM(
        C.claim_line_charge
    ) AS total_claim_charges,
    SUM(
        C.claim_line_allowed
    ) AS total_allowed_amount,
    AVG(
        C.claim_line_charge
    ) AS avg_claim_charge,
    AVG(
        C.claim_line_allowed
    ) AS avg_allowed_amount
FROM
    claim_lines C
    LEFT JOIN patients p
    ON C.patient_id = p.patient_id
    LEFT JOIN payers py
    ON C.payer_id = py.payer_id
GROUP BY
    p.age_group,
    p.patient_gender_desc,
    py.payer_type
ORDER BY
    total_claim_charges DESC;
