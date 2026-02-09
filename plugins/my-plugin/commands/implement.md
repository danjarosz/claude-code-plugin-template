---
description: Plan and implement a feature or fix from a URL or text description
argument-hint: <url-or-description>
model: opus
---

You are implementing a feature or fix based on requirements provided by the user.
Work through this in two distinct phases: **planning**, then **implementation**.

Follow the {{AGENT_NAME}} agent's approach and restrictions defined in:

@${CLAUDE_PLUGIN_ROOT}/agents/my-agent.md

---

## Input

The user has provided: $ARGUMENTS

---

## Phase 1 — Analysis & Plan

### Step 1: Extract Requirements

**If the argument is a URL:**
1. Fetch the page with WebFetch and extract the title, description, and acceptance criteria.
2. If WebFetch fails (authentication), tell the user:
   > I cannot access this URL — it may require authentication.
   > Either configure an appropriate MCP server for authenticated access, or paste the content here.

**If the argument is plain text:**
1. Use the text as-is.
2. Ask clarifying questions if the requirements are ambiguous.

### Step 2: Explore the Codebase

Before planning, explore:
1. Project structure and tech stack (config files, file extensions).
2. Existing similar features, components, or patterns.
3. Testing setup and conventions.
4. Documentation structure (`README.md`, `CLAUDE.md`).

### Step 3: Draft the Implementation Plan

Write a concise plan covering:
1. **Summary** — what will be built or changed.
2. **Approach** — high-level technical strategy.
3. **Files to modify / create** — specific paths with reasons.
4. **Step-by-step changes** — ordered list.
5. **Testing strategy** — how to validate.
6. **Documentation updates** — what docs need updating.

### Step 4: Ask for Approval

Present the plan and ask:

> Here is my implementation plan. Reply **yes** to proceed, or give me feedback to adjust.

**Do not proceed to Phase 2 until the user explicitly approves.**

---

## Phase 2 — Implementation

### Step 1: Implement Incrementally

Execute the approved plan step by step:
- Make small, focused changes.
- Follow the project's existing code style and patterns.

### Step 2: Validate

1. Run type checks (if applicable).
2. Run linters and fix issues.
3. Run existing tests.

### Step 3: Update Documentation

Update relevant docs (`README.md`, `CLAUDE.md`, etc.) if user-facing behaviour changed.

### Step 4: Summarize

Provide a concise summary:
- What was implemented.
- Files changed.
- Any important decisions made.

### Step 5: Ask About Git

Ask for explicit permission before creating any commits, pushing, or opening PRs.
