# AI BI Project Agent

This repository is the reusable AI BI agent workspace for Codex-assisted delivery projects in VS Code. It packages the five-phase workflow, project templates, and guardrails.

## What This Agent Does

Every AI BI delivery project follows:

1. Data Source Discovery and Project Setup
2. Business Logic Understanding
3. SQL / Snowflake Development
4. Data Validation
5. Power BI PBIP Development

The controlling workflow is documented in `_workflow/AI_BI_5_Phase_Workflow.md`, and Codex operating rules are in `AGENTS.md`.

## Team Quick Start

1. Clone or copy this repository locally.
2. Open the repository folder in VS Code.
3. Start Codex from this folder and ask it to follow `AGENTS.md`.
4. Type `1` when you want to start a new AI BI project.
5. Create each new project under `projects/<Project_Name>/`.
6. Keep generated project outputs local unless a specific project has been reviewed and approved for sharing.

For detailed teammate setup, use `TEAM_SETUP.md`.

## Local Save Rule

Generated project work belongs under:

```text
projects/<Project_Name>/
```

Do not leave important delivery output only in Codex chat. Save SQL, DAX, documentation, validation summaries, source inventories, assumptions, open questions, and Power BI PBIP work in the relevant local project folder.

## GitHub Package Rule

GitHub stores the reusable agent framework by default, not active project history. Existing project folders, raw data, uploads, logs, caches, secrets, and generated deliverables are ignored unless separately reviewed and approved.

Before publishing, use `GITHUB_TRANSFER_CHECKLIST.md` and confirm only reusable agent files are shared.

## Safety Rules

Do not store passwords, tokens, connection strings, private keys, or large raw data extracts. Do not modify an existing project workspace unless the user explicitly names that project and asks for changes.

During Phase 1, check whether relevant data is available in Snowflake. Validate user-provided Snowflake objects first; otherwise use metadata-first discovery and wait for user confirmation before choosing Snowflake over another source.
