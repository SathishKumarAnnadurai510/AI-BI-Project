# Snowflake Data Discovery Task

Use this task during Phase 1 whenever a project may have relevant data in Snowflake.

## Goal

Find candidate Snowflake tables, views, and columns that can support the requested business logic, then present suggestions to the user for approval.

## Discovery Order

1. Use Snowflake objects provided by the user, if available.
2. Search local dbt source YAML, model SQL, and project documentation.
3. Search Snowflake metadata when a connection is available:
   - `INFORMATION_SCHEMA.TABLES`
   - `INFORMATION_SCHEMA.COLUMNS`
   - `ACCOUNT_USAGE.TABLES`
   - `ACCOUNT_USAGE.COLUMNS`
4. Profile only shortlisted candidates with read-only queries.

## Metadata Search Terms

Search by:

- user-provided table or view names
- business terms from the request
- known SQL Server source names
- join keys
- region, sales organization, country, or market columns
- date columns needed for filters
- KPI or metric terms

## Output File

For each project, save results to:

- `01_data_source_discovery/snowflake_data_discovery.md`

## Required Recommendation Format

| Candidate | Why It May Fit | Key Columns | Date Columns | Filter Columns | Confidence | User Decision |
| --- | --- | --- | --- | --- | --- | --- |

## Gate

Do not choose a Snowflake source automatically. The user decides whether to use a suggested Snowflake object, stay with SQL Server, or use another source.
