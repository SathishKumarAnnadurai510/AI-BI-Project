# New Project Setup Checklist

Use this checklist for every new project created under `AI BI Project`.

## Step 1 - Project Name

Ask the user for the project name before creating any files.

## Step 2 - Workspace

Create:

- `projects/<Sanitized_Project_Name>/README.md`
- `projects/<Sanitized_Project_Name>/01_data_source_discovery_project_setup`
- `projects/<Sanitized_Project_Name>/02_business_logic_understanding`
- `projects/<Sanitized_Project_Name>/03_sql_snowflake_development`
- `projects/<Sanitized_Project_Name>/04_data_validation`
- `projects/<Sanitized_Project_Name>/05_power_bi_development`
- `projects/<Sanitized_Project_Name>/logs`

## Step 3 - Initialize Phase Files

Copy or adapt templates from `_workflow/templates`.

## Step 4 - Phase 1 Gate

Do not start Phase 2 until:

- all required sources are identified,
- Snowflake data discovery is completed or documented as unavailable,
- Snowflake candidate sources are presented to the user when found,
- accessibility is verified,
- missing access is resolved or explicitly acknowledged,
- the user confirms which source path to use when multiple source paths exist,
- user approves moving to Phase 2.

## Step 5 - Phase Gates

- Phase 2 requires business logic approval before Phase 3.
- Phase 3 must stop and ask before Phase 4.
- Phase 4 must validate SQL/Snowflake output before Phase 5.
- Phase 5 starts only after user approval.
