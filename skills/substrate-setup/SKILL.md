---
name: substrate-setup
description: Help a new user build the lean-OS layer that makes Claude Code work as a thinking system. Use when someone is setting up Claude Code for knowledge work (not just coding) and needs to structure their always-loaded identity layer vs their load-on-demand context layer. Walks them from a blank setup to a working CLAUDE.md hierarchy.
---

# Substrate setup

The goal: a setup where Claude knows who the user is and how they work, without
drowning every session in context it doesn't need. Two layers.

## 1. The always-loaded layer (keep it lean)
A short root pointer + an `identity/` set that loads every session:
- **who** — role, focus, the few facts that change every answer
- **how they communicate** — voice, register, what they refuse
- **boundaries** — what's protected (time, topics, people)

Rule: if a fact doesn't change most answers, it does NOT belong here. Lean root,
or it becomes a drag on every session.

## 2. The load-on-demand layer
A `context/` set Claude reads only when relevant: the deeper IP, project state,
people, tools. Pointed to from the root, pulled in when the task calls for it.
This is progressive disclosure: the context appears only when its task does.

## 3. Wire the hooks
Install the plugin's hooks so the setup runs itself: SessionStart loads context,
Stop reflects and proposes filing learnings, and the boundary guard asks before
you publish. Deterministic, not dependent on the model remembering.

## 4. Maintain it
Every few months, prune. Old instructions can quietly steer a newer, more capable
model the wrong way, so keep a short "what's retired" list and overwrite canon as
it sharpens rather than stacking new copies on old.

Ask the user what they do, who they serve, and how they like to be spoken to.
Draft the always-loaded layer first. Stop there until it's right. Then context.
