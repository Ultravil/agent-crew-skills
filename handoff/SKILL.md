---
name: handoff
description: Write a full handoff note so a fresh session can continue without carrying over old confusion. Use when a long session has become unwieldy or the owner asks for a fresh start, or when work changes hands. Also use when the owner types /handoff.
---

# /handoff: a clean handover

Compacting a long conversation drags old dead ends and wrong guesses forward. A handoff note lets a fresh session start clean. Write it before the fresh session starts; the new session reads it first.

## Where

Write it to a plain file the new session can find, for example `docs/handoff-<YYYY-MM-DD>.md`. Never put secrets in it: name the setting, never its value.

## The note, in this order

**First, `## What the owner has to do`:** every open item that only the owner can do, one numbered line each, in plain words. Write "Nothing right now" if empty. Check each item before listing it: can the owner do it today, and has it already been answered? Do not copy old lines across unchecked. Mark optional items optional.

1. **Goal**: the current task's goal, in two or three lines.
2. **Current state**: what is done, merged, live, or only on a branch. Branch, folder, latest commit.
3. **Active files**: every file being worked on now, and why.
4. **Changes made**: each change with its commit, one line each.
5. **Failed attempts**: what was tried and did not work, and why, so nobody repeats it. Include dead ends, wrong guesses and anything that broke.
6. **Next steps**: specific and ordered, with the exact commands or files.
7. **Rules**: the project's instructions and the checks that must pass before work is called done.
8. **Open questions**: anything unclear.

## Starting the fresh session

1. When the note is written, start a new session (or clear the current one, if your tool supports it).
2. Send the fresh session a first message: read the handoff note first, confirm you understand it, and list anything unclear. A fresh session knows nothing and does nothing until it gets that message.
3. Check that it picked the note up by reading its answer.
4. Tell the owner plainly that this is a handover and work continues from the note, and repeat anything new from "What the owner has to do".
5. Archive the old session only after checking it has no unmerged work and nothing still running.
