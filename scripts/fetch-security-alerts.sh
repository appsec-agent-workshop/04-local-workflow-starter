#!/usr/bin/env bash
set -euo pipefail

# This workflow starter intentionally fetches alerts from repo 03 because
# repo 03 contains the workshop's live vulnerable app and security findings.
repo="${1:-appsec-agent-workshop/03-repo-agent-starter}"
out_dir="${2:-evidence/live}"

mkdir -p "$out_dir"

rm -f "${out_dir}/code-scanning-alerts.json" "${out_dir}/dependabot-alerts.json"
code_tmp="${out_dir}/code-scanning-alerts.json.partial"
dependabot_tmp="${out_dir}/dependabot-alerts.json.partial"
trap 'rm -f "$code_tmp" "$dependabot_tmp"' EXIT

if ! gh api "repos/${repo}/code-scanning/alerts?state=open" > "$code_tmp"; then
  echo "Could not fetch code scanning alerts for ${repo}. Use fallback fixture alerts/codeql-sample.json if API access is unavailable." >&2
  exit 1
fi

if ! gh api "repos/${repo}/dependabot/alerts?state=open" > "$dependabot_tmp"; then
  echo "Could not fetch Dependabot alerts for ${repo}. Continue with the CodeQL fixture if API access is unavailable." >&2
  exit 1
fi

mv "$code_tmp" "${out_dir}/code-scanning-alerts.json"
mv "$dependabot_tmp" "${out_dir}/dependabot-alerts.json"

echo "Wrote live read-only alert evidence to ${out_dir}/"
echo "- ${out_dir}/code-scanning-alerts.json"
echo "- ${out_dir}/dependabot-alerts.json"
