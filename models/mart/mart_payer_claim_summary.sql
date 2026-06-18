WITH claim_lines AS (
    SELECT * FROM {{ ref("fct_claim_lines") }}
),
payers AS ( SELECT * FROM {{ ref("dim_payers") }})
SELECT
    py.payer_type,
    COUNT(c.claim_id) AS claim_count,
    ROUND(SUM(c.claim_line_charge), 2) AS total_claim_charges,
    ROUND(SUM(c.claim_line_allowed), 2) AS total_allowed_amount,
    ROUND(AVG(c.claim_line_charge), 2) AS avg_claim_charge,
    ROUND(AVG(c.claim_line_allowed), 2) AS avg_allowed_amount,
    ROUND(SUM(c.claim_line_allowed)/(SUM(c.claim_line_charge)) * 100, 2) AS pct_reimbursed
FROM claim_lines c
LEFT JOIN payers py ON c.payer_id = py.payer_id
GROUP BY py.payer_type
ORDER BY total_claim_charges DESC