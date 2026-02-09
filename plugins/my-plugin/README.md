# {{PLUGIN_NAME}} Plugin

{{PLUGIN_DESCRIPTION}}

## Directory Structure

```
{{PLUGIN_NAME}}/
├── .claude-plugin/
│   └── plugin.json    # Plugin manifest (name, version, metadata)
├── agents/            # Agent definitions
├── skills/            # Skill definitions
├── commands/          # Command definitions
└── README.md          # This file
```

## Adding Features

- **Agents** — Add agent definition files to `agents/`
- **Skills** — Add skill definition files to `skills/`
- **Commands** — Add command definition files to `commands/`

After adding any feature, update both the root `README.md` and `docs/FEATURES.md` to keep the documentation current.
