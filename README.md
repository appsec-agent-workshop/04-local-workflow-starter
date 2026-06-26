# 04 - Local workflow automation starter

Use this repository during the workshop section:
**Local workflow automation with Copilot CLI or GitHub Copilot app**.

## Goal

Run a repeatable local workflow that chains alert intake, context planning, fact extraction, reasoning, confidence checks, validation, and human next action.

## What is already scaffolded

```text
alerts/codeql-sample.json
prompts/local-triage-workflow-prompt.md
reports/report-template.md
scripts/fetch-security-alerts.sh
```

## Exercise

Fetch live read-only alert evidence when you have access:

```bash
bash scripts/fetch-security-alerts.sh
```

By default this fetches from `appsec-agent-workshop/03-repo-agent-starter`, because that repo contains the workshop's live vulnerable app and security findings. If your repos live in another org or you are testing a fork, pass it explicitly:

```bash
bash scripts/fetch-security-alerts.sh OWNER/REPO
```

Open `prompts/local-triage-workflow-prompt.md`, paste it into Copilot CLI or the GitHub Copilot app, and point it at `evidence/live/code-scanning-alerts.json`. If live API access is unavailable, use the fallback fixture `alerts/codeql-sample.json`.

## Done when

- The output uses `reports/report-template.md`.
- The workflow states whether it used live evidence or the fallback fixture.
- The workflow challenges its own draft.
- The final recommendation includes missing evidence and human next action.
