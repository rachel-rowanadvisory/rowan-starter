#!/bin/bash
# SessionStart — load the right context every session, deterministically.
# Generic version: reinforces that durable learnings get filed as they happen,
# rather than hoping the rule is in context. Edit the message for your own setup.
today=$(date +%Y-%m-%d)
ctx="Today is ${today}. File durable learnings (facts, decisions, preferences, state changes) into your memory/context layer as they occur, don't wait to be asked. Your context files are the source of truth; if anything conflicts, they win."
/usr/bin/python3 - "$ctx" <<'PY'
import json, sys
print(json.dumps({"hookSpecificOutput": {"hookEventName": "SessionStart", "additionalContext": sys.argv[1]}}))
PY
exit 0
