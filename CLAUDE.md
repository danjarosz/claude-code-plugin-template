# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

A private Claude Code plugin marketplace (modeled after `anthropics/claude-plugins-official`) containing one plugin: **{{PLUGIN_NAME}}**. The plugin is at v{{PLUGIN_VERSION}} with one agent defined (`{{AGENT_NAME}}`).

## Repository Layout

```
├── .claude-plugin/marketplace.json          # Marketplace manifest (required by CLI)
├── install.sh / update.sh / uninstall.sh   # Plugin lifecycle scripts (use `claude` CLI)
├── docs/FEATURES.md                         # Feature catalog — must stay in sync
└── plugins/{{PLUGIN_NAME}}/
    ├── .claude-plugin/plugin.json           # Plugin manifest (name, version, metadata)
    ├── agents/                              # Agent definition files
    ├── skills/                              # Skill definition files
    └── commands/                            # Command definition files
```

## Key Commands

```bash
# Install the plugin into Claude Code
./install.sh

# Update to latest version
./update.sh

# Remove plugin
./uninstall.sh

# Verify plugin is registered
claude plugin list
```

## Adding a New Feature

1. Add a definition file to the appropriate directory under `plugins/{{PLUGIN_NAME}}/`:
   - `agents/` for agent definitions
   - `skills/` for skill definitions
   - `commands/` for command definitions
2. **After implementing any new skill**: Update relevant agents and commands that should reference or use the new skill
3. Bump `version` in both `plugins/{{PLUGIN_NAME}}/.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`
4. Update **both** the root `README.md` and `docs/FEATURES.md` with the new feature

## Documentation Rules

Always keep `README.md`, `CLAUDE.md`, and `docs/FEATURES.md` up to date when implementing new features or updating the existing codebase. Every code change that adds, modifies, or removes functionality must include corresponding documentation updates in the same changeset.

## MCP Servers

The project includes a `.mcp.json` at the repo root that configures shared MCP servers for all contributors.

| Server | Package | Purpose |
|--------|---------|---------|
| `context7` | `@upstash/context7-mcp@latest` | Fetches up-to-date, version-specific documentation and code examples from official sources |

**Documentation Lookup Order:**

1. **Always search Context7 MCP server first** for documentation and code examples
2. Fall back to **Web Search** only if Context7 doesn't have the needed documentation

**Prerequisite:** Node.js and `npx` must be available on the system (Context7 runs via `npx`).

Verify with:
```bash
claude mcp list          # Confirm context7 appears
```

## Marketplace Identifiers

- **Marketplace repo:** `{{GITHUB_OWNER}}/{{REPO_NAME}}`
- **Plugin identifier:** `{{PLUGIN_NAME}}@{{REPO_NAME}}`
