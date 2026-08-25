# {{PROJECT_NAME}}

Project workspace for the AI BI five-phase delivery workflow.

## Phase Status

| Phase | Status | Notes |
| --- | --- | --- |
| Phase 1 - Data Source Discovery And Project Setup | In progress | Waiting for source details and access validation. |
| Phase 2 - Business Logic Understanding | Not started | Starts only after Phase 1 is completed and approved. |
| Phase 3 - SQL / Snowflake Development | Not started | Starts only after Phase 2 is completed and approved. |
| Phase 4 - Data Validation | Not started | Starts only after Phase 3 is completed and user confirms validation. |
| Phase 5 - Power BI PBIP Development | Not started | Starts only after Phase 4 validation passes and user approves. |

## Workspace Structure

| Folder | Purpose |
| --- | --- |
| `01_data_source_discovery_project_setup` | Source inventory, source summary, access validation, and missing access reports. |
| `02_business_logic_understanding` | Business logic document, rules, requirements, questions, dependencies, and risks. |
| `03_sql_snowflake_development` | SQL, Snowflake views, stored procedures, and code explanations. |
| `04_data_validation` | Validation queries, results, mismatch analysis, and corrective actions. |
| `05_power_bi_development` | Project PBIP copy, semantic model, DAX measures, report visuals, slicers/filters, and validation notes. |
| `logs` | Running project log. |
