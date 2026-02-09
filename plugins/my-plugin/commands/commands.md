---
description: Display the quick-reference table of all available commands with arguments, descriptions, and usage tips
model: inherit
---

You are displaying the command reference for the `{{PLUGIN_NAME}}` plugin.

Print the following reference exactly as shown (do not add or remove content):

---

## {{PLUGIN_NAME}} plugin — Command Reference

| Command | Arguments | Description |
|---------|-----------|-------------|
| `/implement` | `<url-or-description>` | Plan and implement a feature or fix from a URL or plain-text description. Two phases: (1) analysis & plan, (2) implementation after approval. |
| `/commands` | — | Show this command reference. |

---

### `/implement <url-or-description>`

**Workflow:** Explores the codebase, drafts a plan, waits for approval, then implements incrementally.

**Usage:**
```
/implement https://example.com/issues/123
/implement Add a responsive navbar component with mobile hamburger menu
```

**Tips for best results:**

- **Issue URLs** — Include a clear title, description with context, acceptance criteria as a checklist, and links to designs or mockups.
- **Plain text** — Be specific. Include what to build, where, and any constraints.

See [docs/FEATURES.md](docs/FEATURES.md) for the full feature reference including agents and skills.
