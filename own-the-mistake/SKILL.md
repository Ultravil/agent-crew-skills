---
name: own-the-mistake
description: A routine for handling any mistake made during a piece of work. Use every time a mistake shows up (the owner points one out, a test or check finds one, or you notice your own), before moving on. Explains why it happened, fixes it, makes a lasting change so it cannot happen again, proves the fix, and logs it. Also use when the owner says "that's a mistake" or "why did you get this wrong".
---

# Own the mistake

A mistake is not handled until all six steps are done. Do them in the same turn you learn of it, and tell the owner in plain words.

## 1. Stop and name it

Say plainly what went wrong and what it cost: a wrong result, a broken feature, a wrong claim, lost time. No softening.

## 2. Find the real cause

Ask "why?" until you reach a cause you can change. "A bug" or "I forgot" is not a cause. Good causes look like:
- I relied on a check that cannot see the real thing.
- A step existed but nothing made me do it.
- I guessed instead of looking.

Read the project's mistakes log (step 6). If the same cause is already there, say so: it is a repeat, and the last change was not strong enough.

## 3. Fix this case

Fix the actual problem now, or hand it off with a clear brief. Say who is fixing it and when it will be done.

## 4. Make a lasting change

Pick the strongest one that fits, and actually make it:
1. **A test or automatic check** that fails if it happens again (best: nothing relies on anyone remembering).
2. **A required, checked step** in the process or script that does that job.
3. **A rule** in the project's agent instructions.
4. **A saved note** with the reason and when to apply it. Use this only when nothing stronger fits.

Write down where the change lives (a file path). "I'll be more careful" is not a change.

## 5. Prove it

Check that the fix worked on the real thing, not a stand-in: run the real command, open the real screen, read the real output.

## 6. Log it and tell the owner

Add a row at the top of the project's mistakes log (for example `docs/mistakes-log.md`; create it if missing): Date | Mistake | Why it happened | Fix | What changed for good.

Then tell the owner in short bullets: what went wrong, why it happened, the fix (and whether it is proven yet), and what changed for good and where it lives. If it is a repeat, say why the new change is stronger.
