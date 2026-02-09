# {{REPO_NAME}}

{{PLUGIN_DESCRIPTION}}

This repository acts as a **private plugin marketplace** (same pattern as `anthropics/claude-plugins-official`) containing a single plugin: `{{PLUGIN_NAME}}`.

## Prerequisites

- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed and available as `claude`
- [Node.js](https://nodejs.org/) (provides `npx`, required by the Context7 MCP server)

## Installation

### Using the script

```bash
./install.sh
```

### Manual

```bash
claude plugin marketplace add {{GITHUB_OWNER}}/{{REPO_NAME}}
claude plugin install {{PLUGIN_NAME}}@{{REPO_NAME}}
```

After installing, run `/plugin` in Claude Code to confirm the plugin is listed and enabled.

## Update

### Using the script

```bash
./update.sh
```

### Manual

```bash
claude plugin marketplace update {{GITHUB_OWNER}}/{{REPO_NAME}}
claude plugin update {{PLUGIN_NAME}}@{{REPO_NAME}}
```

## Uninstall

### Using the script

```bash
./uninstall.sh
```

### Manual

```bash
claude plugin uninstall {{PLUGIN_NAME}}@{{REPO_NAME}}
claude plugin marketplace remove {{GITHUB_OWNER}}/{{REPO_NAME}}
```

## Repository Structure

```
├── .claude-plugin/
│   └── marketplace.json   # Marketplace manifest (required by CLI)
├── install.sh / update.sh / uninstall.sh
└── plugins/{{PLUGIN_NAME}}/
    ├── .claude-plugin/
    │   └── plugin.json    # Plugin manifest
    ├── agents/            # Agent definitions
    ├── skills/            # Skill definitions
    ├── commands/          # Command definitions
    └── README.md
```

## Included Agent

### {{AGENT_DISPLAY_NAME}} (`{{AGENT_NAME}}`)

{{AGENT_DESCRIPTION_SHORT}}. The agent explores the codebase first, matches project conventions, and makes incremental, focused changes. It automatically detects and adapts to the project's technology stack rather than defaulting to a preferred technology. When referencing external documentation, it searches the Context7 MCP server first and falls back to Web Search only if needed. The agent always asks for permission before committing or sending anything to external services. After implementation, it updates README.md and CLAUDE.md to keep documentation in sync.

Triggers automatically when you ask questions or request work in the agent's domain.

## Included Commands

| Command | Arguments | Description |
|---------|-----------|-------------|
| `/implement` | `<url-or-description>` | Plan and implement a feature or fix. Two phases: (1) analysis & plan, (2) implementation after approval. |
| `/commands` | — | Display the quick-reference table of all commands with arguments, descriptions, and usage tips. |

### `/implement`

Plan and implement a feature or fix from an issue URL or plain-text description. Runs in two phases:

1. **Analysis & Plan** — Extracts requirements (fetches URLs via WebFetch or uses plain text), explores the codebase, and drafts an implementation plan covering approach, files, steps, testing, and documentation.
2. **Implementation** — After the user approves the plan, executes it incrementally, validates with type checks / linters / tests, updates documentation, and asks before committing.

```bash
# From an issue URL
/implement https://example.com/issues/123

# From a plain-text description
/implement Add a responsive navbar component with mobile hamburger menu
```

**Tips for best results:**

- **Issue URLs** — Include a clear title, description with context, acceptance criteria as a checklist, and links to designs or mockups. If authentication blocks WebFetch, paste the issue content directly or configure an appropriate MCP server.
- **Plain text** — Be specific about what to build, where, and any constraints.

### `/commands`

Show the quick-reference table of all available commands directly in the terminal. Handy when you need a fast reminder of what's available and how to invoke each command.

```bash
/commands
```

## Feature Reference

See [docs/FEATURES.md](docs/FEATURES.md) for the full list of all agents, skills, and commands — including detailed workflow descriptions and usage tips.

## Adding Features

1. **Agent** — Add a definition file to `plugins/{{PLUGIN_NAME}}/agents/`
2. **Skill** — Add a definition file to `plugins/{{PLUGIN_NAME}}/skills/`
3. **Command** — Add a definition file to `plugins/{{PLUGIN_NAME}}/commands/`
4. Bump the `version` in both `plugins/{{PLUGIN_NAME}}/.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`
5. **Update documentation** — Add the new feature to both this `README.md` and `docs/FEATURES.md`
# claude-code-plugin-template
