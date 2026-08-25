# AI BI Project Codex Instructions

These instructions apply to Codex sessions working inside this `AI_BI_Project` / `AI BI Project` folder.

## Operating Rules

- Follow `_workflow/AI_BI_5_Phase_Workflow.md` for every AI BI delivery project.
- Create each new project under `projects/<Project_Name>`.
- Use `_workflow/project_workspace_template` and `_workflow/templates` when setting up a project.
- Do not modify an existing project workspace unless the user explicitly names that project and asks for changes.
- Do not skip workflow gates. Stop when required access, source files, mappings, or business logic are missing.

## Local Result Storage

- Save all important Codex-generated outputs as files under the relevant project folder.
- Update `logs/project_log.md` at the end of every phase.
- Treat the local workspace as the active system of record for generated project work unless the user explicitly asks to use GitHub.
- Do not commit, push, create branches, or open pull requests unless the user explicitly asks for GitHub work.
- GitHub is for the approved reusable agent framework by default. If the user asks to publish project-specific work, save only approved project files and keep raw data and secrets out of GitHub.

## Snowflake Data Discovery

- During Phase 1, identify whether relevant data is available in Snowflake.
- If the user provides Snowflake objects, validate those objects first.
- If the user does not provide objects, search available Snowflake metadata, dbt source files, model files, and local documentation for candidate tables, views, and columns.
- Use metadata-first discovery before row-level profiling. Capture candidate objects, key columns, date columns, filter columns, and confidence level.
- Present Snowflake source suggestions to the user and wait for the user to decide whether to use them.
- Do not choose Snowflake over SQL Server or another source without user confirmation.

## Power BI PBIP Development

- During Phase 5, create a project-specific copy of `_workflow/power_bi_templates/empty_pbip/` under `projects/<Project_Name>/05_power_bi_development/power_bi_project/`.
- Prefer `_workflow/power_bi_templates/copy_empty_pbip.ps1 -ProjectName <Project_Name>` for the copy and rename step when available.
- Rename the copied PBIP file and artifact folders to the project name and update copied `.pbip`, `.pbir`, and `.platform` references.
- Build Power BI model logic, DAX measures, report pages, and visuals only inside the copied project PBIP.
- Do not modify the reusable empty PBIP template during project work.
- Do not claim Phase 5 is complete unless the copied PBIP structure, DAX measures, and visuals have been validated in approved Power BI tooling, or the remaining validation gap is clearly documented.

## File Safety

- Do not store secrets, passwords, tokens, private keys, or connection strings.
- Do not store large raw data extracts unless the user explicitly approves.
- Store SQL, DAX, documentation, validation summaries, source inventories, assumptions, open questions, and Power BI design notes.

## Phase Completion Checklist

At the end of each phase, make sure the project folder contains:

- the phase output files requested by the workflow
- completed tasks
- pending tasks
- risks
- open questions
- recommended next step
- an updated `logs/project_log.md`

## Response Templates

When acknowledging a Power BI report update request, this is an approved example reply:

```text
Thanks for reaching out to us.

We will review your request and update the Power BI report accordingly. We will let you know once the changes are completed.
```

## Session Start Behavior

When a new session begins in this workspace, before doing any task, respond with a short friendly greeting and an interactive menu. Use this flow:

- Greet the user (e.g. "Hi! Welcome to your AI BI workspace.").
- First ask: "Shall we start a new project?"
- In one line, state what this workspace does (5-phase AI BI delivery: Data Discovery, Business Logic, SQL, Validation, Power BI).
- Ask what they would like to do and present these options as a numbered list:
  1. Start a NEW AI BI project (I will ask for the project name and begin Phase 1).
  2. Continue an EXISTING project (I will list projects under projects/ and ask which one).
  3. Automate or repeat a task (e.g. rerun validation, regenerate SQL, refresh Power BI notes).
  4. Review or check an existing project's status.
  5. Just chat / nothing right now.
- Wait for the user's choice. Do not start any phase, create files, or run queries until the user picks an option.

Handling a decline or "no":
- If the user declines, says "no", "not now", "just looking", picks option 5, or ignores the menu and asks something else, DO NOT insist and DO NOT repeat the menu.
- Acknowledge briefly (e.g. "No problem - I'm here whenever you need me.") and then simply answer whatever the user asks as a normal assistant.
- Never pressure the user to start a project or automation. Offer the menu only once per session unless the user asks "what can you do" or "show options" again.
- The menu is an offer, not a gate. The user is always free to just talk or ask a one-off question.

General:
- Ask only one question at a time. Keep responses short and conversational.
- After the user chooses an action, confirm your understanding in one sentence before acting.
