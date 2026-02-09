# Feature Reference

Quick reference to all agents, skills, and commands in the `{{PLUGIN_NAME}}` plugin.

> **Keep this file up-to-date** whenever you add, modify, or remove a feature.

## Agents

| Name | Description |
|------|-------------|
| `{{AGENT_NAME}}` | {{AGENT_DESCRIPTION_SHORT}}. Automatically detects and adapts to the project's technology stack instead of defaulting to a preferred framework. Uses Context7 for documentation lookup with Web Search fallback. Always asks before committing or sending to external services. Updates README.md and CLAUDE.md after implementation. |

## Skills

| Name | Trigger | Description |
|------|---------|-------------|
| —    | —       | No skills yet. |

## Commands

| Name | Arguments | Description |
|------|-----------|-------------|
| `/implement` | `<url-or-description>` | Plan and implement a feature or fix from a URL or plain-text description. Runs in two phases: (1) explores the codebase and drafts an implementation plan, (2) implements after user approval. |
| `/commands` | — | Display the quick-reference table of all available commands with arguments, descriptions, and usage tips. |

---

## Command Reference

### `/implement <url-or-description>`

Plan and implement a feature or fix. Accepts an **issue URL** or a **plain-text description**.

#### Workflow

1. **Phase 1 — Analysis & Plan**
   - Extracts requirements from the URL (via WebFetch) or the provided text.
   - Explores the codebase structure, tech stack, and conventions.
   - Drafts an implementation plan (approach, files, steps, testing, docs).
   - Presents the plan and waits for your approval.

2. **Phase 2 — Implementation**
   - Executes the approved plan incrementally.
   - Validates with type checks, linters, and tests.
   - Updates documentation.
   - Asks for permission before any git operations.

#### Usage

```bash
# From an issue URL
/implement https://example.com/issues/123

# From a plain-text description
/implement Add a responsive navbar component with mobile hamburger menu
```

#### Tips for Best Results

**When using an issue URL:**

The command fetches the issue via WebFetch. If the URL requires authentication, you'll be prompted to paste the content manually or configure an appropriate MCP server. For the best output, make sure your issue includes:

- A clear **title** summarizing the feature or fix.
- A **description** explaining the context and desired behaviour.
- **Acceptance criteria** as a checklist so the agent knows when the task is done.
- **Attachments or links** to designs, mockups, or reference implementations (the agent can fetch public URLs).

**When using a plain-text description:**

Be specific. The more detail you provide, the better the plan will be:

- **Good:** `Add a responsive navbar with logo on the left, navigation links in the centre, and a hamburger menu on screens below 768px`
- **Vague:** `Add a navbar`

Include relevant constraints (requirements, browser support, performance budgets) directly in the description.

---

### `/commands`

Display the quick-reference table of all available commands. Useful for a fast reminder of what's available and how to invoke each command.

#### Usage

```bash
/commands
```
