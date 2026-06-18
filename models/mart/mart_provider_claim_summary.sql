WITH providers AS ( SELECT * FROM {{ ref("dim_providers") }}),
claim_lines AS (
    SELECT * FROM {{ ref("fct_claim_lines") }} )


SELECT
    p.classification,
    p.specialization,
    COUNT(c.claim_id) AS claim_count,
    ROUND(SUM(c.claim_line_charge), 2) AS total_claim_charges,
    ROUND(SUM(c.claim_line_allowed), 2) AS total_allowed_amount,
    ROUND(AVG(c.claim_line_charge), 2) AS avg_claim_charge,
    ROUND(AVG(c.claim_line_allowed), 2) AS avg_allowed_amount,
    ROUND(TRY_DIVIDE(SUM(c.claim_line_allowed), SUM(c.claim_line_charge)) * 100, 2) AS pct_reimbursed
FROM providers p
LEFT JOIN claim_lines c ON p.provider_id = c.provider_id
GROUP BY p.classification, p.specialization
ORDER BY total_claim_charges DESC