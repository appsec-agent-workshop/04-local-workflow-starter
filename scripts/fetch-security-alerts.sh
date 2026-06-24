#!/usr/bin/env bash
set -euo pipefail

repo="${1:-appsec-agent-workshop/03-repo-agent-starter}"
out_dir="${2:-evidence/live}"

mkdir -p "$out_dir"

gh api "repos/${repo}/code-scanning/alerts?state=open" > "${out_dir}/code-scanning-alerts.json"
gh api "repos/${repo}/dependabot/alerts?state=open" > "${out_dir}/dependabot-alerts.json"

echo "Wrote live read-only alert evidence to ${out_dir}/"
echo "- ${out_dir}/code-scanning-alerts.json"
echo "- ${out_dir}/dependabot-alerts.json"
