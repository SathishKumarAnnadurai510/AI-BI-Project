# Empty PBIP Template

Reusable blank Power BI Project template for Phase 5.

This template contains:

- `EmptyPowerBI.pbip`
- `EmptyPowerBI.Report/`
- `EmptyPowerBI.SemanticModel/`

It intentionally does not contain source data, credentials, cache files, project-specific tables, or prebuilt report visuals.

When starting Phase 5, copy this full folder into:

```text
projects/<Project_Name>/05_power_bi_development/power_bi_project/
```

Then rename the copied PBIP file and artifact folders to the project name. Update:

- `<Project_Name>.pbip` report artifact path
- `<Project_Name>.Report/definition.pbir` semantic model path
- copied `.platform` display names
- copied `.platform` logical IDs with new GUIDs

Do not edit this template directly during project work.
