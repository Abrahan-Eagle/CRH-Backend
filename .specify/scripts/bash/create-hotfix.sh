#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -f "$SCRIPT_DIR/common.sh" ]; then
    source "$SCRIPT_DIR/common.sh"
else
    echo "Error: Could not find common.sh in $SCRIPT_DIR" >&2
    exit 1
fi

JSON_MODE=false
ARGS=()
for arg in "$@"; do
    case "$arg" in
        --json) JSON_MODE=true ;;
        --help|-h) echo "Usage: $0 [--json] <incident_description>"; exit 0 ;;
        *) ARGS+=("$arg") ;;
    esac
done

INCIDENT_DESCRIPTION="${ARGS[*]}"
if [ -z "$INCIDENT_DESCRIPTION" ]; then
    echo "Usage: $0 [--json] <incident_description>" >&2
    exit 1
fi

REPO_ROOT=$(get_repo_root)
HAS_GIT=$(has_git && echo "true" || echo "false")

cd "$REPO_ROOT"

SPECS_DIR="$REPO_ROOT/specs"
mkdir -p "$SPECS_DIR"

HIGHEST=0
if [ -d "$SPECS_DIR" ]; then
    for dir in "$SPECS_DIR"/hotfix-*; do
        [ -d "$dir" ] || continue
        dirname=$(basename "$dir")
        number=$(echo "$dirname" | sed 's/hotfix-//' | grep -o '^[0-9]\+' || echo "0")
        number=$((10#$number))
        if [ "$number" -gt "$HIGHEST" ]; then HIGHEST=$number; fi
    done
fi

NEXT=$((HIGHEST + 1))
HOTFIX_NUM=$(printf "%03d" "$NEXT")

BRANCH_SUFFIX=$(echo "$INCIDENT_DESCRIPTION" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/-\+/-/g' | sed 's/^-//' | sed 's/-$//')
WORDS=$(echo "$BRANCH_SUFFIX" | tr '-' '\n' | grep -v '^$' | head -3 | tr '\n' '-' | sed 's/-$//')
BRANCH_NAME="hotfix/${HOTFIX_NUM}-${WORDS}"
HOTFIX_ID="hotfix-${HOTFIX_NUM}"

if [ "$HAS_GIT" = true ]; then
    git checkout -b "$BRANCH_NAME"
else
    >&2 echo "[hotfix] Warning: Git repository not detected; skipped branch creation for $BRANCH_NAME"
fi

HOTFIX_DIR="$SPECS_DIR/${HOTFIX_ID}-${WORDS}"
mkdir -p "$HOTFIX_DIR"

HOTFIX_TEMPLATE="$REPO_ROOT/.specify/extensions/workflows/hotfix/hotfix-report-template.md"
POSTMORTEM_TEMPLATE="$REPO_ROOT/.specify/extensions/workflows/hotfix/post-mortem-template.md"

HOTFIX_FILE="$HOTFIX_DIR/hotfix.md"
POSTMORTEM_FILE="$HOTFIX_DIR/post-mortem.md"

if [ -f "$HOTFIX_TEMPLATE" ]; then
    cp "$HOTFIX_TEMPLATE" "$HOTFIX_FILE"
else
    echo "# Hotfix" > "$HOTFIX_FILE"
fi

if [ -f "$POSTMORTEM_TEMPLATE" ]; then
    cp "$POSTMORTEM_TEMPLATE" "$POSTMORTEM_FILE"
else
    echo "# Post-Mortem" > "$POSTMORTEM_FILE"
fi

TIMESTAMP=$(date -u +"%Y-%m-%d %H:%M:%S UTC")
if grep -q "\[YYYY-MM-DD HH:MM:SS UTC\]" "$HOTFIX_FILE" 2>/dev/null; then
    sed -i.bak "0,/\[YYYY-MM-DD HH:MM:SS UTC\]/s/\[YYYY-MM-DD HH:MM:SS UTC\]/$TIMESTAMP/" "$HOTFIX_FILE" 2>/dev/null || \
    sed -i '' "0,/\[YYYY-MM-DD HH:MM:SS UTC\]/s/\[YYYY-MM-DD HH:MM:SS UTC\]/$TIMESTAMP/" "$HOTFIX_FILE" 2>/dev/null || \
    true
    rm -f "$HOTFIX_FILE.bak" 2>/dev/null || true
fi

REMINDER_FILE="$HOTFIX_DIR/POST_MORTEM_REMINDER.txt"
cat > "$REMINDER_FILE" << EOF
POST-MORTEM REMINDER
====================

Hotfix ID: $HOTFIX_ID
Incident Start: $TIMESTAMP

Post-mortem due within 48 hours (constitution §VI).

Post-Mortem File: $POSTMORTEM_FILE
EOF

export SPECIFY_HOTFIX="$HOTFIX_ID"

if $JSON_MODE; then
    printf '{"HOTFIX_ID":"%s","BRANCH_NAME":"%s","HOTFIX_FILE":"%s","POSTMORTEM_FILE":"%s","HOTFIX_NUM":"%s","TIMESTAMP":"%s"}\n' \
        "$HOTFIX_ID" "$BRANCH_NAME" "$HOTFIX_FILE" "$POSTMORTEM_FILE" "$HOTFIX_NUM" "$TIMESTAMP"
else
    echo "HOTFIX_ID: $HOTFIX_ID"
    echo "BRANCH_NAME: $BRANCH_NAME"
    echo "HOTFIX_FILE: $HOTFIX_FILE"
    echo "POSTMORTEM_FILE: $POSTMORTEM_FILE"
    echo "HOTFIX_NUM: $HOTFIX_NUM"
    echo "INCIDENT_START: $TIMESTAMP"
fi
