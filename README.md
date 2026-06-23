# Healthcare Claims Analytics

End-to-end analytics engineering project built using Databricks, dbt, PySpark, SQL, Unity Catalog, and Tableau.

## Project Overview

This project analytizes healthcare claims data to uncover insights related to: 

- Claim charges by payer type
- Patient segment spending patterns
- Reimbursement rates across insurance programs
- Provider classification performance

The project follows a modern Medallion Architecture (Bronze, Silver Gold) using Databricks and dbt.


## Tech Stack

- Databricks
- dbt
- PySpark
- SQL
- Unity Catalog
- Tableau


## Architecture



### Bronze Layer

Raw healthcare claims data ingested into Databricks.

### Silver Layer

Standardized staging models created with dbt.

Examples:

- stg_patients
- stg_claims
- stg_providers
- stg_payers
- stg_diagnoses

### Gold Layer

Analytics-ready dimensional model consisting of:

Dimensions:
- dim_patients
- dim_providers
- dim_payers
- dim_diagnoses

Fact:
- fct_claim_lines

Business Marts:
- mart_claims_by_patient_segment
- mart_payer_claim_summary
- mart_provider_claim_summary

## Tableau Dashboard

Interactive Dashboard built in Tableau Public.

Dashboard highlights:

- Total healthcare claim charges
- Claims by patient age segment
- Reimbursement percentage by payer type
- Top provider classifications by total charges

View Dashboard: 

[Tableau Dashboard] https://public.tableau.com/app/profile/azure.augustus/viz/HealthcareClaimsAnalyticsDashboard_17821694323430/Dashboard1?publish=yes

## Key Findings

- Adult patients generated the highest total claim charges.
- Medicaid represented the largest payer cateogry by total charges.
- Reimbursement percentages varied significantly across payer types.
- General Acute Care Hospitals generated the highest provider charges.

## Dashboard Preview

![Dashboard](../../screenshots/dashboard.png)

## dbt Lineage

![Lineage](../../screenshots/lineage.png)

