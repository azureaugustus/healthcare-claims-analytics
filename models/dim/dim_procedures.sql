WITH procedures AS (
    SELECT
        *
    FROM
        {{ ref('stg_procedures') }}
)
SELECT
    procedure_code,
    procedure_code_qual
FROM
    procedures
