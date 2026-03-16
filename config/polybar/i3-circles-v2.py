#!/usr/bin/env python3
import json, subprocess

# Define our characters
filled = ["❶", "❷", "❸", "❹", "❺", "❻", "❼", "❽", "❾", "❿"]
empty  = ["①", "②", "③", "④", "⑤", "⑥", "⑦", "⑧", "⑨", "⑩"]

try:
    # Ask i3 for workspace data
    out = subprocess.check_output(['i3-msg', '-t', 'get_workspaces'], stderr=subprocess.DEVNULL)
    workspaces = json.loads(out)

    # Find which one is currently active
    focused = next((ws['num'] for ws in workspaces if ws['focused']), None)

    result = ""
    for i in range(1, 11):
        # Choose filled if selected, empty if not
        char = filled[i-1] if i == focused else empty[i-1]

        # Format for Polybar (Clickable + Colors)
        if i == focused:
            # Bright white for the active filled circle
            result += f"%{{T3}}%{{A1:i3-msg workspace {i}:}}%{{F#ffffff}}{char}%{{F-}}%{{A}}%{{T-}}"
        else:
            # Dark gray for the empty inactive circles
            result += f"%{{T3}}%{{A1:i3-msg workspace {i}:}}%{{F#555555}}{char}%{{F-}}%{{A}}%{{T-}}"

    print(result.strip())
except Exception:
    pass
