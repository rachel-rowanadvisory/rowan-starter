#!/bin/bash
# Stop — the self-improving half. Reflects once at end of a working session and
# proposes filing anything durable. Loop-guarded + debounced to once / 30 min so
# it is never a per-reply nag. It only PROPOSES; filing is the agent's call.
input=$(cat)
active=$(printf '%s' "$input" | /usr/bin/python3 -c 'import sys,json;
try: print(json.load(sys.stdin).get("stop_hook_active", False))
except Exception: print(False)' 2>/dev/null)
if [ "$active" = "True" ]; then exit 0; fi
stamp="$HOME/.claude/.last-reflect-rowan"
now=$(date +%s); last=0
[ -f "$stamp" ] && last=$(cat "$stamp" 2>/dev/null || echo 0)
if [ $(( now - last )) -lt 1800 ]; then exit 0; fi
echo "$now" > "$stamp"
/usr/bin/python3 <<'PY'
import json
reason = ("Session reflection (auto, at most once / 30 min). Before ending: scan this "
          "session for anything DURABLE: a changed fact, a decision, a new preference, "
          "a state change worth keeping. If yes, file it into your context/memory layer "
          "now, then stop. If nothing durable changed, just stop, don't invent something.")
print(json.dumps({"decision": "block", "reason": reason}))
PY
exit 0
