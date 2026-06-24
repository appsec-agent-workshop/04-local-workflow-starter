# Local triage workflow prompt

Use this prompt in Copilot CLI or the GitHub Copilot app.

```text
You are helping me triage a Dependabot or CodeQL alert for human AppSec review.

Use this workflow:

1. Prefer live alert evidence from evidence/live/code-scanning-alerts.json and evidence/live/dependabot-alerts.json.
2. If live evidence is unavailable, read the fallback fixture alerts/codeql-sample.json.
3. Extract deterministic alert facts into a table.
4. Identify what repository context would be needed.
5. Use available workspace files only when they exist. Do not invent missing repository facts.
6. Apply this route set:
   - fix-now
   - campaign-candidate
   - needs-reachability-analysis
   - needs-codeql-timeout-investigation
   - human-escalation
7. Apply confidence ceilings for stale, missing, or timed-out CodeQL, missing tests, unknown runtime exposure, or unproven reachability.
8. Draft the recommendation using reports/report-template.md.
9. Challenge your own draft:
   - Did you claim reachability without evidence?
   - Did you treat Autofix as proof?
   - Did you ignore stale, missing, or timed-out CodeQL or tests?
   - Did you recommend automatic dismissal or severity change?
10. Rewrite the final report after the challenge.
```
