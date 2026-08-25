# Local File Workflow

The AI BI Project now uses local-file storage by default.

## Default Save Location

Save all project outputs under:

- `projects/<Project_Name>/`

Each project should contain phase folders and `logs/project_log.md`.

## Required Behavior

- Save generated SQL, DAX, notes, summaries, validations, assumptions, open questions, and source inventories as files.
- Update `logs/project_log.md` at the end of every phase or major task.
- Keep raw extracts, passwords, tokens, private keys, and connection strings out of project files.
- Do not push to GitHub unless the user explicitly asks.

## Optional GitHub Use

GitHub may still be used later for sharing or backup, but only after the user asks for it. When that happens, publish approved project outputs only.
