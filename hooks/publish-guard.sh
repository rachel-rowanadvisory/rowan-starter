#!/bin/bash
# PreToolUse(Bash) — the boundary guard. Before a command that PUBLISHES
# (here: any `git push`), pause and ask, so going public is always a human
# decision and never automatic. Add your own outward steps to the pattern
# below (deploy, release, send). Generic by design; make it yours.
input=$(cat)
cmd=$(printf '%s' "$input" | /usr/bin/python3 -c 'import sys,json;
try: print(json.load(sys.stdin).get("tool_input",{}).get("command",""))
except Exception: print("")' 2>/dev/null)
case "$cmd" in
  *"git push"*)
    /usr/bin/python3 <<'PY'
import json
print(json.dumps({"hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "ask",
    "permissionDecisionReason": "This publishes (git push). Confirm you want to send it out. Publishing should be your call, not automatic."}}))
PY
    exit 0 ;;
esac
exit 0
