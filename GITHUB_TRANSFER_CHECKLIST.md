# GitHub Transfer Checklist

Use this checklist before publishing the AI BI agent files to GitHub.

## Include

- `AGENTS.md`
- `README.md`
- `TEAM_SETUP.md`
- `GITHUB_TRANSFER_CHECKLIST.md`
- `.gitignore`
- `.github/workflows/ai-bi-package-ci.yml`
- `_workflow/`
- `_workflow/power_bi_templates/empty_pbip/`
- `_workflow/power_bi_templates/copy_empty_pbip.ps1`
- `projects/.gitkeep`
- `projects/README.md`

## Exclude

- Existing `projects/<Project_Name>/` workspaces
- `projects/_external_repos/`
- Local-only reference folders: `diagnostics/`, `pbi/`, `Power BI Governance/`
- Local-only reference files: `AI_BI_Admin_Technical_Reference.docx`
- `.env` and `.env.*`
- Runtime logs, cache folders, Power BI `.pbi/` folders, temp files, screenshots, and `__pycache__`
- Raw extracts and generated deliverables such as `.csv`, `.xlsx`, `.parquet`, `.pbix`, and `.zip`
- Any secrets, passwords, tokens, private keys, or connection strings

## Local Verification

From the repository root, confirm the reusable package shape:

```powershell
Test-Path AGENTS.md
Test-Path README.md
Test-Path TEAM_SETUP.md
Test-Path _workflow
Test-Path _workflow\power_bi_templates\empty_pbip\EmptyPowerBI.pbip
Test-Path _workflow\power_bi_templates\copy_empty_pbip.ps1
```

## GitHub Upload Review

Before pushing:

```powershell
git status --short
git diff --cached --stat
```

Confirm the staged files are reusable framework files only. Do not stage local project output folders unless a specific project has been reviewed and approved for sharing.
