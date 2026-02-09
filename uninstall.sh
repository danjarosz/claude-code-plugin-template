#!/usr/bin/env bash
set -euo pipefail

REPO="{{GITHUB_OWNER}}/{{REPO_NAME}}"
PLUGIN="{{PLUGIN_NAME}}@{{REPO_NAME}}"

echo "=== {{PLUGIN_NAME}}: Uninstall ==="

# Check prerequisites
if ! command -v claude &>/dev/null; then
  echo "Error: 'claude' CLI not found."
  exit 1
fi

# Uninstall the plugin
echo "Uninstalling plugin: $PLUGIN ..."
claude plugin uninstall "$PLUGIN"

# Remove the marketplace registration
echo "Removing marketplace: $REPO ..."
claude plugin marketplace remove "$REPO"

# Verify removal
echo ""
echo "Verifying removal ..."
if claude plugin list 2>/dev/null | grep -q "{{PLUGIN_NAME}}"; then
  echo "Warning: Plugin may still be listed. Run '/plugin' in Claude Code to check."
else
  echo "Success: {{PLUGIN_NAME}} plugin has been removed."
fi
