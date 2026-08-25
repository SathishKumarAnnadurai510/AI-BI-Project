# GitHub Connections

## edw_lss_analytics_dbt

- Repository: `Avantor-CodeHub/edw_lss_analytics_dbt`
- Branch: `dev_sat_test`
- Requested path: `models/BIE_Project_Automation`
- Local sparse checkout: `_external_repos/edw_lss_analytics_dbt`
- Local requested folder: `_external_repos/edw_lss_analytics_dbt/models/BIE_Project_Automation`
- Connected on: 2026-06-29

## Current Files In Requested Folder

- `test.sql`

## Notes

- Checkout was created with sparse checkout to limit local files to the requested project path plus repository root configuration files.
- Do not modify or push changes unless the user explicitly requests it.
- GitHub syncing is paused for the AI BI Project. Continue saving project outputs locally unless the user explicitly asks to publish or sync.

## AI BI Project Deployment Recommendation

- Preferred GitHub location: a dedicated private repository for `AI_BI_Project`.
- Accepted location in `Avantor-CodeHub/edw_lss_analytics_dbt`: repository root path `AI_BI_Project/`.
- Avoid deploying AI BI workspace files under `models/BIE_Project_Automation/AI_BI_Project/` because dbt can parse `.sql` files below `models/` as dbt models.
- If GitHub is explicitly requested later, result files should be committed under `AI_BI_Project/projects/<Project_Name>/`.
- If GitHub is explicitly requested later, use one branch per project or delivery task, for example `ai-bi/<project-name>`.
