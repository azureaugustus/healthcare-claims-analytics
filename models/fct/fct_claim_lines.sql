WITH claims AS (
    SELECT
        *
    FROM
        {{ ref('stg_claims') }}
)
SELECT
    claim_id,
    patient_id,
    provider_id,
    diagnosis_code,
    claim_type,
    procedure_code,
    payer_type AS payer_id,
    date_service,
    place_of_service_id,
    revenue_code,
    procedure_units_billed,
    claim_line_charge,
    claim_line_allowed
FROM
    claims
