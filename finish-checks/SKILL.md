---
name: finish-checks
description: A checklist to run in one go before reporting a task finished: lint, type check, the full tests, build, review, documentation, commit and an honest report. Use before saying a task is done.
---

# /finish-checks: before you say "done"

Run these in order. Stop and fix at the first failure, then start again from the top. Adapt the commands to your project; the rules around them are the point.

**Before any check**, make sure the tools exist (for example `which npm node`). Judge every check by its **exit code**, never only by counting error lines: a missing tool prints zero errors and is a false pass.

1. **Lint** must pass.
2. **Type check** must pass with exit code 0.
3. **The full test suite**, not a subset. Report how many ran and compare with the previous run: fewer tests than before means something did not run. If a test only times out while the machine is busy, re-run it alone and report both results.
4. **If you changed screens:** run the production build and the browser tests for those screens, then open the screen and use it. A passing test is not the same as a working button.
5. **If you produced anything visual (a design, an image, a video):** look at all of it, not only the parts you changed.
6. **If you changed the database schema:** add a new migration instead of editing an old one, and add a test for each kind of user affected, including what must be refused.
7. **Review:** run a code review of your branch and fix every real finding. Report each as fixed or skipped, with a reason.
8. **Documentation:** update the notes for the area you changed when you added or changed an important file, rule or gotcha.
9. **Commit** on your own branch with a plain message, and only after you have read exit code 0 from the checks. Do not chain a commit onto the check command unless it is gated on that exit code.
10. **Report** the result with numbers, what is not done or not checked, and what you would do next.
