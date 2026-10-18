---
name: hello-world
description: Say hello immediately when the user selects Hello World, asks for a greeting with it, or asks to run or test the Hello World plugin.
---

# Hello World

## Perform the greeting

This is an instructions-only skill. Its complete task is to write a greeting in your response. No executable tool, MCP server, backend, network request or separate execution step is involved.

When the user selects this skill or asks to run, execute, invoke or test Hello World, immediately reply with this exact sentence:

Hello, world! Your Hello World plugin from teknologika.com is working.

Do not ask whether to execute, inspect or test it: the user's invocation already requests the greeting. Do not substitute a diagnostic report about missing tools or backend execution. Do not call tools to produce the greeting.

If the user explicitly asks to inspect or explain these instructions instead of running the greeting, answer that request normally. Be accurate about verification: the greeting demonstrates this skill's response only, not a backend call or validation of other plugins. Do not request personal information.
