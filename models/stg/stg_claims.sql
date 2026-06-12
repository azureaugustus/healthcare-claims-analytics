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
    claim_id,
    hvid AS patient_id,
    prov_rendering_npi AS provider_id,
    diagnosis_code,
    claim_type,
    procedure_code,
    payer_type,
    date_service,
    place_of_service_std_id AS place_of_service_id,
    revenue_code,
    diagnosis_code_qual,
    line_charge AS claim_line_charge,
    line_allowed AS claim_line_allowed
FROM
    claims_raw
