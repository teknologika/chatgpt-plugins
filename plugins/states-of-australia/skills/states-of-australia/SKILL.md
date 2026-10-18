---
name: states-of-australia
description: Use when the user selects States of Australia or asks to test its local MCP tool by choosing an Australian state.
---

# States of Australia

If no state is supplied, ask: "Which Australian state would you like to explore?" Wait for the answer. If the user already supplied a state, continue immediately.

Call the plugin's `explore_state` MCP tool with the state name or abbreviation. Supply only `state`; the server selects the action internally. Do not pick the action yourself or substitute your own geographic answer.

Present the tool's returned message, followed by its action and request ID on a short separate line so the test can be traced. Offer to try another state. If the tool returns an invalid-state error, explain it and ask for one of the six states.

If the tool is unavailable or fails, report that specific issue without claiming that a call succeeded or inventing a result. The greeting-only Hello World plugin is a separate test; do not change it.
