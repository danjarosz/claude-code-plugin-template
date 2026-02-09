#!/usr/bin/env bash
set -euo pipefail

REPO="{{GITHUB_OWNER}}/{{REPO_NAME}}"
PLUGIN="{{PLUGIN_NAME}}@{{REPO_NAME}}"

echo "=== {{PLUGIN_NAME}}: Install ==="

# Check prerequisites
if ! command -v claude &>/dev/null; then
  echo "Error: 'claude' CLI not found. Install Claude Code first."
  exit 1
fi

# Add the repository as a private marketplace
echo "Adding marketplace: $REPO ..."
claude plugin marketplace add "$REPO"

# Install the plugin at user scope
echo "Installing plugin: $PLUGIN ..."
claude plugin install "$PLUGIN"

# Verify installation
echo ""
echo "Verifying installation ..."
if claude plugin list 2>/dev/null | grep -q "{{PLUGIN_NAME}}"; then
  echo "Success: {{PLUGIN_NAME}} plugin is installed."
else
  echo "Warning: Could not verify installation. Run '/plugin' in Claude Code to check."
fi
