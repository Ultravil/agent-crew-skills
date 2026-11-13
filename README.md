# agent-crew-skills

Six small skills for coding agents that work with a human owner. Each folder holds one `SKILL.md` (plus a script where noted). They are plain Markdown instructions, written to be read by an agent, and work in any project.

## The skills

**own-the-mistake**: a six-step routine for every mistake: say what went wrong, find the real cause, fix this case, make a lasting change (a test, a required step, a rule, or a note), prove the fix on the real thing, then log it and tell the owner in plain words.

**handoff**: how to write a full handoff note before a long session is replaced by a fresh one, so nothing is lost and no dead ends are carried forward. The note starts with what only the owner can do, then goal, state, active files, changes, failed attempts and next steps, and the skill covers starting the fresh session and checking it picked the note up.

**recap**: a catch-up for the owner after a break, in one fixed shape: what was done, what was decided, questions answered, what the owner must do, and what is running now. It reads a time window such as "last 2 hours" or "since my last message" and checks every claim against what actually landed.

**finish-checks**: a "done" checklist run in one go: lint, type check, the full test suite judged by exit code, build, screen checks, migration rules, review, docs, commit and an honest report. It exists to stop false passes and half-finished work from being reported as finished.

**watch-video**: turns a public video link (Instagram, TikTok, YouTube) into timestamped frames and a timestamped transcript on your own machine, then analyses them as one timeline. Includes `watch.sh`, which needs `yt-dlp`, `ffmpeg` and `whisper-cli` (whisper.cpp) installed, plus a whisper model file (set `WHISPER_MODEL`, or use `~/.local/share/whisper/ggml-small.bin`).

**video-breakdown**: a fixed answer shape for a video link the owner sends: what it shows, a fact check, how it helps, an item table, a plan that keeps what was asked apart from the agent's own ideas, and a few questions, with nothing installed until the owner answers. It uses `watch-video`.

## Install

Copy the folders you want into your agent's skills folder, for example for Claude Code:

```
cp -R own-the-mistake handoff recap finish-checks watch-video video-breakdown ~/.claude/skills/
```

For one project only, copy them into `.claude/skills/` inside that project instead. Make the script executable if needed: `chmod +x ~/.claude/skills/watch-video/watch.sh`.

## License

MIT, see `LICENSE`.
