# Rowan Starter (v0.2, seed)

A working Claude Code setup, packaged so someone inherits the harness on day one
instead of rebuilding it. Free to take, copy, and make your own.

It's a *seed*: it carries the shape of the method, not anyone's personal voice.
Grow your own from here.

It pairs with the frame behind it, [A verifiable core for
one](https://ip.rowanadvisory.co.nz/verifiable-core-for-one/): why a one-person
setup is built this way, and what the whole thing is for.

## What's in it

- **Three hooks** (`hooks/`):
  - `session-context.sh` (SessionStart): loads context every session, so the
    setup starts pointed the right way instead of cold.
  - `session-reflect.sh` (Stop): reflects once per working session and proposes
    filing anything durable. Loop-guarded, debounced to once / 30 min, propose-only.
  - `publish-guard.sh` (PreToolUse): pauses and asks before a `git push`, so going
    public is always your call. Generalise it to your own outward steps.
- **One skill** (`skills/substrate-setup`): walks a new user from a blank setup to
  a lean, two-layer context hierarchy (always-loaded identity vs load-on-demand
  context).

## What it deliberately is NOT

Not anyone's personal voice skills (how *they* draft an email, run a meeting, scope
a proposal). Those are personal. This bundles the shape, not the contents.

## Install

Point a plugin marketplace at this folder, or drop it under your Claude Code plugins
path and enable `rowan-starter`. The hooks resolve their own location via
`${CLAUDE_PLUGIN_ROOT}`. Then edit the message in `session-context.sh` to your own
words. That one line is the whole personalisation.

## Licence

MIT. Free to use, modify, and distribute. See [`LICENSE`](LICENSE).
