#!/usr/bin/env bash
# watch-video: turn a PUBLIC video link (Instagram, TikTok, YouTube) into frames + a transcript an agent can read.
# Usage:  watch.sh <url> [seconds-between-frames]   -> prints the work folder
#         watch.sh --clean <work-folder>             -> deletes it
# Needs yt-dlp, ffmpeg and whisper-cli (whisper.cpp). Model file: $WHISPER_MODEL, else ~/.local/share/whisper/ggml-small.bin.
# Never uses cookies or logins. Files are temporary; delete them once read.
set -euo pipefail
MODEL="${WHISPER_MODEL:-$HOME/.local/share/whisper/ggml-small.bin}"
TMP="${TMPDIR:-/tmp}"
TMP="${TMP%/}"

if [[ "${1:-}" == "--clean" ]]; then
  DIR="${2:-}"
  if [[ -n "$DIR" && "$DIR" == "$TMP"/watch-video.* && -d "$DIR" ]]; then
    rm -rf -- "$DIR"
    echo "deleted $DIR"
  fi
  exit 0
fi

URL="${1:?usage: watch.sh <url> [seconds]}"
EVERY="${2:-2}"
[[ "$URL" =~ ^https:// ]] || { echo "only https links" >&2; exit 2; }
for tool in yt-dlp ffmpeg whisper-cli; do
  command -v "$tool" >/dev/null 2>&1 || { echo "missing tool: $tool" >&2; exit 4; }
done
WORK="$(mktemp -d "$TMP/watch-video.XXXXXX")"
mkdir -p "$WORK/frames"

yt-dlp --no-playlist --no-cookies-from-browser --max-filesize 300M \
  -f "bv*[height<=720]+ba/b" --merge-output-format mp4 -o "$WORK/video.%(ext)s" --print-to-file "%(title)s | %(uploader)s | %(duration)ss" "$WORK/info.txt" \
  "$URL" >/dev/null 2>"$WORK/download.log" || { echo "DOWNLOAD FAILED (the site may require a login; not using cookies):"; tail -3 "$WORK/download.log"; exit 3; }
VIDEO="$(ls "$WORK"/video.* | head -1)"

ffmpeg -loglevel error -i "$VIDEO" -vf "fps=1/$EVERY,scale=720:-2" "$WORK/frames/%03d.jpg"
if ffmpeg -loglevel error -i "$VIDEO" -vn -ar 16000 -ac 1 "$WORK/audio.wav" 2>/dev/null && [[ -f "$MODEL" ]]; then
  whisper-cli -m "$MODEL" -f "$WORK/audio.wav" -otxt -osrt -of "$WORK/transcript" -np >/dev/null 2>&1 || echo "(transcription failed)" > "$WORK/transcript.txt"
else
  echo "(no audio, or speech model missing at $MODEL)" > "$WORK/transcript.txt"
fi
# name frames by timestamp (frame N covers second (N-1)*EVERY)
i=0; for f in $(ls "$WORK/frames" | sort); do t=$((i*EVERY)); mv "$WORK/frames/$f" "$WORK/frames/t$(printf '%04d' $t)s.jpg"; i=$((i+1)); done
rm -f "$VIDEO" "$WORK/audio.wav"

echo "WORK=$WORK"
echo "INFO: $(cat "$WORK/info.txt" 2>/dev/null)"
echo "TRANSCRIPT: $WORK/transcript.srt (timestamped; plain text in transcript.txt)"
echo "FRAMES: $(ls "$WORK/frames" | wc -l | tr -d ' ') images in $WORK/frames, named t0000s.jpg = second 0 (one every ${EVERY}s)"
