# AI BI Agent Team Setup

Use this guide when a teammate copies the AI BI agent from GitHub and runs it locally in VS Code.

## 1. Copy The Agent

Clone or download the GitHub repository to a local folder, then open that folder in VS Code.

```powershell
cd "<local-path>\AI BI Project"
code .
```

The repository root is the agent workspace. Codex reads `AGENTS.md` from this folder and follows the 5-phase AI BI workflow under `_workflow/`.

## 2. Use From VS Code With Codex

Start Codex from the repository root in VS Code and ask it to follow the local instructions.

Typical prompt:

```text
Start a new AI BI project and follow AGENTS.md.
```

Codex should show the workspace menu, ask for one decision at a time, create new work under `projects/<Project_Name>/`, and stop at each required workflow gate when source access, files, mappings, or business logic are missing.

For a new project, type:

```text
1
```

Then provide the project name when Codex asks.

## 3. Power BI Phase

Phase 5 creates a project-specific PBIP copy from `_workflow/power_bi_templates/empty_pbip/`.

Codex should build Power BI model logic, DAX, report pages, and visuals inside:

```text
projects/<Project_Name>/05_power_bi_development/power_bi_project/
```

The repeatable copy step is:

```powershell
.\_workflow\power_bi_templates\copy_empty_pbip.ps1 -ProjectName <Project_Name>
```

Power BI Desktop or approved Power BI tooling is required to validate the finished PBIP before Phase 5 is marked complete.

## 4. Local Storage Default

By default, generated work stays on the teammate's machine:

```text
projects/<Project_Name>/
```

Set a different project storage path only if the team has approved it. Do not store passwords, tokens, connection strings, private keys, large raw extracts, or unapproved customer data in this repository.

## 5. Before Sharing Changes

Review `GITHUB_TRANSFER_CHECKLIST.md`, then confirm only reusable agent files are shared. Existing project folders should remain local unless they have separate approval.
