---
name: recap
description: A catch-up for the owner after a break: what was done, what was decided, questions answered, what the owner needs to do, and what is running now. Use when the owner types /recap, says "recap", "catch me up", "what did I miss", or comes back from a break.
---

# Recap

Give one clear catch-up that can be read in a couple of minutes.

## Gather quietly

1. Find the time window. A window may follow `/recap` ("last 2 hours", "today", "since my last message"); use exactly that range. With none given, use the time since the owner's last real message before the break, or the last 24 hours if unclear. Get the current time with `date` and put the window in the first heading.
2. Read what the project keeps: its task list or notes, any status files, and `git log --since=<start> --oneline` on the main branch for what actually landed.
3. Re-read this conversation for the owner's questions, decisions and anything you promised.
4. Check facts before stating them: what is merged versus only on a branch, what is live versus waiting on the owner. Never say done for something that is not.

## Write it in this shape

Plain English, no jargon, no ids, no file names, no commit hashes. Short bullets, with the main phrase of each in bold.

1. **What I've done (since <when>)**: grouped under small headings by area, one line each, with the real result or number when there is one.
2. **What we talked about and what you decided**
3. **Your questions, answered**: each question in a few words, then the short answer.
4. **What you need to do**: a numbered list, most important first: what, where, and what to tell me when it is done.
5. **What's running now**: one or two lines.

End there. If nothing happened in the window, say so in one line, then give section 4.
