#!/usr/bin/env bash
# PreToolUse guard for the Bash tool: forces a manual "ask" permission decision
# for destructive shell commands, even when the session is running in
# bypass-permissions mode. Non-destructive commands fall through silently
# (no output = normal permission flow applies).

input="$(cat)"
cmd="$(printf '%s' "$input" | jq -r '.tool_input.command // empty')"

flag=0

# rm -rf / -fr (any letter order, combined or separate flags)
printf '%s' "$cmd" | grep -qiE 'rm[[:space:]]+(-[[:alnum:]]*[rR][[:alnum:]]*f|-[[:alnum:]]*f[[:alnum:]]*[rR])([[:space:]]|$)' && flag=1

# git push --force / --force-with-lease / -f
printf '%s' "$cmd" | grep -qiE 'git[[:space:]]+push[^&|;]*(--force(-with-lease)?([[:space:]]|=|$)|[[:space:]]-f([[:space:]]|$))' && flag=1

# git reset --hard
printf '%s' "$cmd" | grep -qiE 'git[[:space:]]+reset[^&|;]*--hard' && flag=1

# git clean with a force flag
printf '%s' "$cmd" | grep -qiE 'git[[:space:]]+clean[^&|;]*-[[:alnum:]]*f' && flag=1

# git checkout -- <path>  or  git checkout .   (discards working-tree changes)
printf '%s' "$cmd" | grep -qiE 'git[[:space:]]+checkout[[:space:]]+(--([[:space:]]|$)|\.([[:space:]]|$))' && flag=1

# git restore <path>  (discards working-tree changes) — exempt pure "--staged" (safe, only unstages)
if printf '%s' "$cmd" | grep -qiE 'git[[:space:]]+restore([[:space:]]|$)'; then
  printf '%s' "$cmd" | grep -qiE -- '--staged' || flag=1
fi

# git branch -D (force delete) — case-sensitive: lowercase -d (safe, merged-only) must NOT match
printf '%s' "$cmd" | grep -qE 'git[[:space:]]+branch[^&|;]*(-[[:alnum:]]*D[[:alnum:]]*|--delete[[:space:]]+--force|--force[[:space:]]+--delete)' && flag=1

# hook/signature bypass flags
printf '%s' "$cmd" | grep -qE '(^|[[:space:]])--no-verify([[:space:]]|$)' && flag=1
printf '%s' "$cmd" | grep -qE '(^|[[:space:]])--no-gpg-sign([[:space:]]|$)' && flag=1
printf '%s' "$cmd" | grep -qE 'gpgsign=false' && flag=1

if [[ "$flag" == "1" ]]; then
  echo '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"Destructive shell command detected — manual approval required even in bypass-permissions mode."}}'
fi
