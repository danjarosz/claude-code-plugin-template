#!/usr/bin/env bash
set -euo pipefail

REPO="{{GITHUB_OWNER}}/{{REPO_NAME}}"
PLUGIN="{{PLUGIN_NAME}}@{{REPO_NAME}}"

echo "=== {{PLUGIN_NAME}}: Update ==="

# Check prerequisites
if ! command -v claude &>/dev/null; then
  echo "Error: 'claude' CLI not found."
  exit 1
fi

# Update the marketplace (pulls latest from git)
echo "Updating marketplace: $REPO ..."
claude plugin marketplace update "$REPO"

# Update the installed plugin to the latest version
echo "Updating plugin: $PLUGIN ..."
claude plugin update "$PLUGIN"

# Verify update
echo ""
echo "Verifying update ..."
if claude plugin list 2>/dev/null | grep -q "{{PLUGIN_NAME}}"; then
  echo "Success: {{PLUGIN_NAME}} plugin is up to date."
else
  echo "Warning: Could not verify update. Run '/plugin' in Claude Code to check."
fi
