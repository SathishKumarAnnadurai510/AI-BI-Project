# Phase 5 - Power BI PBIP Development

Project: {{PROJECT_NAME}}

## Phase Status

Status: Not started

## Approved Validation Reference

- Phase 4 approval date:
- Approved by:
- Validated SQL/Snowflake object:
- Phase 4 baseline file:
- Required report audience:

## PBIP Project Copy

| Item | Value |
| --- | --- |
| Template source | `_workflow/power_bi_templates/empty_pbip/` |
| Copy helper | `_workflow/power_bi_templates/copy_empty_pbip.ps1 -ProjectName {{PROJECT_NAME}}` |
| Project PBIP folder | `05_power_bi_development/power_bi_project/` |
| Project PBIP file | `{{PROJECT_NAME}}.pbip` |
| Report artifact | `{{PROJECT_NAME}}.Report/` |
| Semantic model artifact | `{{PROJECT_NAME}}.SemanticModel/` |

## Semantic Model Implementation

| Table | Type | Grain | Source | Relationship Notes |
| --- | --- | --- | --- | --- |
| TBD | Fact / Dimension | TBD | TBD | TBD |

## Relationship Implementation

| From Table | From Column | To Table | To Column | Cardinality | Cross Filter | Status |
| --- | --- | --- | --- | --- | --- | --- |
| TBD | TBD | TBD | TBD | TBD | TBD | Pending |

## DAX Measures

| Measure Name | DAX | Purpose | Format | Validation Result |
| --- | --- | --- | --- | --- |
| TBD | TBD | TBD | TBD | Pending |

## Report Pages And Visuals

| Page | Visual | Purpose | Fields / Measures | Filters / Slicers | Status |
| --- | --- | --- | --- | --- | --- |
| TBD | TBD | TBD | TBD | TBD | Pending |

## PBIP Validation Notes

| Check | Result | Notes |
| --- | --- | --- |
| PBIP copied from template | Pending | |
| PBIP renamed to project name | Pending | |
| `.pbip` report path updated | Pending | |
| `.pbir` semantic model path updated | Pending | |
| `.platform` display names and logical IDs updated | Pending | |
| JSON files parse successfully | Pending | |
| TMDL/model opens or connects in approved tooling | Pending | |
| DAX measures match Phase 4 baseline | Pending | |
| Report pages and visuals reviewed | Pending | |

## Important Assumptions

No assumptions are approved unless explicitly confirmed by the user.

## Power BI Development Summary

TBD

## End Of Phase Summary

- Completed tasks:
- Pending tasks:
- Risks:
- Questions:
- Recommended next step:

## Phase 5 Completion Checklist

- [ ] Phase 4 validation approved
- [ ] Empty PBIP template copied into the project Phase 5 folder
- [ ] Copied PBIP files/folders renamed to the project name
- [ ] Copied PBIP internal references updated
- [ ] Semantic model built from the approved SQL/Snowflake output
- [ ] Relationships implemented
- [ ] DAX measures implemented with correct format strings
- [ ] Report pages and visuals implemented in the copied PBIP
- [ ] DAX validated against Phase 4 baseline
- [ ] PBIP opened or connected in approved Power BI tooling, or validation gap documented
- [ ] Phase 5 summary files saved
- [ ] `logs/project_log.md` updated
