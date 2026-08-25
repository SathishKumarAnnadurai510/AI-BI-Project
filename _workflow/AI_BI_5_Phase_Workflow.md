# AI BI Project - 5 Phase Delivery Workflow

This workflow applies to all new AI BI projects created after 2026-06-29.

Existing project workspaces and outputs must not be changed unless the user explicitly asks for changes to that specific project.

## Operating Principles

- Execute phases sequentially.
- Never skip a phase.
- Never assume business logic.
- Never generate the next stage before the current phase is completed and approved.
- Stop immediately when required information, access, or logic is missing.
- Keep every project independent under `projects/<Project_Name>`.
- Explain understanding before generating technical outputs.
- At the end of every phase provide completed tasks, pending tasks, risks, questions, and recommended next step.

## Phase 1 - Data Source Discovery And Project Setup

Objective: discover, organize, and verify all project data sources before business logic analysis.

Required actions:

- Ask for the project name.
- Create a dedicated project workspace.
- Organize the workspace using the five-phase folder structure.
- Record every available source.
- Identify source name, source type, file path/location, database, schema, table/view names, access requirements, file size, and last modified date when available.
- Identify whether relevant data is available in Snowflake:
  - If the user provides Snowflake objects, validate those objects first.
  - If the user does not provide Snowflake objects, search available Snowflake metadata, dbt source files, dbt model files, and local documentation for candidate tables, views, and columns.
  - Search for business terms, table names, join keys, date columns, region or sales organization columns, and output metrics implied by the request.
  - Save a Snowflake candidate source shortlist with confidence level and open questions.
  - Present the shortlist to the user so the user can decide whether to use Snowflake.
- Verify accessibility.
- Stop if access is unavailable or incomplete.

Phase 1 outputs:

- Project workspace ready.
- Source inventory.
- Source summary.
- Snowflake data discovery notes and candidate source shortlist when Snowflake is relevant.
- Missing access report when applicable.

Gate: Do not begin Phase 2 until required sources are confirmed and accessible. If Snowflake candidates are found, do not use them as primary sources until the user approves the source choice.

## Phase 2 - Business Logic Understanding

Objective: fully understand business requirements before any technical development.

Read and analyze:

- Requirement documents.
- Functional documents.
- Existing SQL or Snowflake views.
- Existing Power BI reports.
- Excel files.
- Data dictionaries.
- Mapping files.
- Business rules.
- Sample outputs.

Identify:

- KPIs.
- Business rules.
- Filters.
- Joins.
- Transformations.
- Calculated fields.
- Dimensions and facts.
- Date logic.
- Exception handling.
- Required outputs.

Detect and stop for:

- Missing logic.
- Ambiguous requirements.
- Conflicting rules.
- Missing mappings.
- Missing lookup tables.

Phase 2 outputs:

- Business logic document.
- Rules summary.
- Required inputs.
- Required outputs.
- Open questions.
- Assumptions, only when explicitly approved or clearly marked as unapproved.
- Dependencies.
- Potential risks.

Gate: Do not generate SQL, Snowflake code, or Power BI content during Phase 2.

## Phase 3 - SQL / Snowflake Development

Objective: generate production-ready SQL queries, Snowflake views, or stored procedures only after Phase 2 logic is approved.

Development standards:

- Follow SQL and Snowflake best practices.
- Write modular code.
- Use meaningful aliases.
- Optimize joins.
- Avoid unnecessary subqueries.
- Document complex logic.
- Save generated SQL in the project workspace.

Phase 3 outputs:

- SQL queries, Snowflake views, or stored procedures.
- Code explanation.
- Input tables.
- Output columns.
- Join logic.
- Filter logic.
- Aggregation logic.
- Business rules applied.
- Performance considerations.

Gate: When Phase 3 is complete, stop and ask:

`The SQL/Snowflake development is complete. Would you like to continue with Phase 4, Data Validation, before moving to Power BI development?`

## Phase 4 - Data Validation

Objective: validate generated SQL or Snowflake views against source data before Power BI development.

Validation must include:

- Row count checks.
- Null checks.
- Duplicate checks.
- Join accuracy checks.
- Aggregation checks.
- Source-to-output comparison.
- Sample record spot checks.
- Business rule checks.

Phase 4 outputs:

- Validation summary.
- Mismatches found.
- Corrective actions.
- Confirmation whether SQL/view output is ready for Power BI.

Gate:

- If validation fails, stop and fix SQL/view logic before proceeding.
- If validation passes, ask whether to continue into Phase 5.

## Phase 5 - Power BI PBIP Development

Objective: create a working project-specific Power BI Project (`.pbip`) from the validated SQL or Snowflake output.

Only after Phase 4 approval:

- Copy the reusable empty PBIP template from `_workflow/power_bi_templates/empty_pbip/` into `projects/<Project_Name>/05_power_bi_development/power_bi_project/`.
- Prefer the helper script `_workflow/power_bi_templates/copy_empty_pbip.ps1 -ProjectName <Project_Name>` for the copy and rename step when running on Windows.
- Rename the copied PBIP file and artifact folders to the project name:
  - `<Project_Name>.pbip`
  - `<Project_Name>.Report/`
  - `<Project_Name>.SemanticModel/`
- Update copied PBIP references:
  - the `.pbip` report artifact path
  - the `.Report/definition.pbir` semantic model path
  - copied `.platform` display names
  - copied `.platform` logical IDs with new GUIDs
- Do not modify the reusable empty template during project work.
- Build the semantic model against the Phase 4 approved SQL/Snowflake output:
  - source connection or Power Query definition
  - fact and dimension tables
  - date table when required
  - relationships and cardinality
  - data types, formats, hidden technical fields, and display folders
- Create required DAX measures with correct syntax, format strings, and `DIVIDE()` for ratios.
- Create report pages and visuals inside the copied PBIP report artifact based on the approved business logic.
- Visuals must be named, aligned, bound to validated model fields/measures, and include required slicers, filters, titles, and tooltips.
- Validate every measure against the Phase 4 baseline numbers using Power BI Desktop, the powerbi-modeling-mcp server, or another approved Power BI validation method.
- Validate PBIP structure by checking JSON/TMDL syntax and opening or connecting to the copied PBIP when tooling is available.
- If Power BI Desktop or MCP validation is unavailable, stop and mark Phase 5 as `PBIP build prepared - pending Power BI validation`; do not claim the report is complete.
- If a measure, model object, or visual fails validation, stop, report the issue, and fix it before continuing.

Phase 5 outputs:

- Copied project PBIP under `05_power_bi_development/power_bi_project/`.
- Semantic model implementation.
- Relationship implementation.
- DAX measure definitions.
- Report pages and visual implementation.
- Filter, slicer, title, and tooltip implementation.
- PBIP validation notes.
- Important assumptions.
- Power BI development summary.

Gate: Do not build Power BI content unless Phase 4 is completed and approved. Do not mark Phase 5 complete unless the copied PBIP has been validated or the remaining validation gap is clearly documented.
