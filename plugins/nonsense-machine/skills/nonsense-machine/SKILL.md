---
name: nonsense-machine
description: Use when the user selects Nonsense Machine, asks to generate fresh server-side nonsense, or wants to test its MCP execution and receipt verification.
---

# Nonsense Machine

If no word was supplied, ask for any word and wait. Otherwise immediately call `generate_nonsense` with that word. The result is generated at runtime; there are no example results or offline substitutes in this skill.

Then call `verify_nonsense` with the returned receiptId. Compare the verified word, verdict, quantity, unit and token against the generation result. Only if they agree, report the result as verified. Present the word, nonsense verdict, quantity and unit, token and receipt ID exactly as returned. Offer to try another word.

If either tool is missing or fails, say which step could not complete. Never invent an output, receipt, token or successful tool invocation. If generation succeeds but verification fails, label the result unverified and explain the failure. Receipts live only in the running server process and may expire or be lost on restart. This is a toy provenance check, not a security attestation.
