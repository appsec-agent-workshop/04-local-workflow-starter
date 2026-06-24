# Local triage workflow prompt

Use this prompt in Copilot CLI or the GitHub Copilot app.

```text
You are helping me triage a Dependabot or CodeQL alert for human AppSec review.

Use this workflow:

1. Read alerts/codeql-sample.json.
2. Extract deterministic alert facts into a table.
3. Identify what repository context would be needed.
4. Use available workspace files only when they exist. Do not invent missing repository facts.
5. Apply this route set:
   - fix-now
   - campaign-candidate
   - needs-reachability-analysis
   - needs-codeql-timeout-investigation
   - human-escalation
6. Apply confidence ceilings for missing CodeQL, missing tests, unknown runtime exposure, or unproven reachability.
7. Draft the recommendation using reports/report-template.md.
8. Challenge your own draft:
   - Did you claim reachability without evidence?
   - Did you treat Autofix as proof?
   - Did you ignore missing CodeQL or tests?
   - Did you recommend automatic dismissal or severity change?
9. Rewrite the final report after the challenge.
```
