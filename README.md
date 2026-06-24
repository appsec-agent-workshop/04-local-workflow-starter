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
```

## Exercise

Open `prompts/local-triage-workflow-prompt.md`, paste it into Copilot CLI or the GitHub Copilot app, and point it at `alerts/codeql-sample.json`.

## Done when

- The output uses `reports/report-template.md`.
- The workflow challenges its own draft.
- The final recommendation includes missing evidence and human next action.
