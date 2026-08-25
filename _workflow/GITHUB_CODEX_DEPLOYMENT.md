# GitHub And Codex Deployment Guide

This is an optional reference only. The active AI BI Project workflow is local-first and saves outputs under the local `projects/<Project_Name>/` folder unless the user explicitly asks to publish or sync to GitHub.

## Recommended Repository Placement

Preferred option:

- Create or use a dedicated private repository for `AI_BI_Project`.

Accepted option when using the existing dbt repository:

- Place this folder at repository root as `AI_BI_Project/`.

Avoid placing this workspace under a dbt `models/` directory. dbt projects usually parse `.sql` files below `models/`, and AI BI phase outputs can include draft SQL, validation SQL, and analysis SQL that are not production dbt models.

## Team Access Pattern

Use this pattern only when the user explicitly asks to use GitHub.

1. Give team members GitHub access to the repository.
2. Each team member connects Codex to GitHub.
3. The user starts Codex from the repository and points it at `AI_BI_Project/`.
4. Codex reads `AGENTS.md` and `_workflow/AI_BI_5_Phase_Workflow.md`.
5. Codex saves every result file under `projects/<Project_Name>/`.
6. Codex commits changes to the active project branch only when the user explicitly asks for GitHub syncing.
7. Codex opens a pull request only when the user explicitly asks for one.

## Branching Pattern

Use one branch per project or delivery task:

- `ai-bi/<project-name>`

Examples:

- `ai-bi/quotation-to-salesorder-conversion`
- `ai-bi/customer-margin-dashboard`

## Result File Contract

When GitHub is explicitly requested, result files should be saved under:

- `projects/<Project_Name>/01_data_source_discovery/`
- `projects/<Project_Name>/02_logical_understanding/`
- `projects/<Project_Name>/03_code_query_generation/`
- `projects/<Project_Name>/04_data_validation/`
- `projects/<Project_Name>/05_power_bi_development/`
- `projects/<Project_Name>/logs/project_log.md`

Codex should not treat chat responses as the final storage location.

The default workflow saves locally. GitHub commits are optional and require an explicit user request.

## What To Commit

Commit:

- project intake notes
- source inventory and source access validation
- business logic summaries
- open questions and assumptions
- generated SQL and validation SQL
- validation summaries and mismatch notes
- DAX measures
- approved Power BI PBIP project files, model notes, visual implementation notes, and validation notes
- project logs

Do not commit:

- passwords, tokens, private keys, or connection strings
- large raw source extracts
- local virtual environments
- nested Git checkouts
- temporary files

## Current Deployment Target

The current available GitHub repository is:

- `Avantor-CodeHub/edw_lss_analytics_dbt`

If this repository is used, deploy this workspace as:

- `AI_BI_Project/`

Do not deploy it under:

- `models/BIE_Project_Automation/AI_BI_Project/`
