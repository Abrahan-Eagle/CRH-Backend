#!/usr/bin/env bash
# CRH impact scan — Laravel + Flutter paths (adapted from spec-kit-extensions)

set -e

FEATURE_DIR="$1"
MODIFICATION_DIR="$2"
DESCRIPTION="$3"

if [ -z "$FEATURE_DIR" ] || [ -z "$MODIFICATION_DIR" ]; then
    echo "Usage: scan-impact.sh <feature-dir> <modification-dir> [description]"
    exit 1
fi

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
FRONT_ROOT="$REPO_ROOT/../CRH-Frontend"

echo "=== CRH Impact Analysis ==="
echo "Feature: $FEATURE_DIR"
echo "Modification: $MODIFICATION_DIR"
echo "Description: ${DESCRIPTION:-N/A}"
echo ""

# Keywords from description (lowercase)
KEYWORDS=$(echo "${DESCRIPTION:-}" | tr '[:upper:]' '[:lower:]' | tr -s ' ' '\n' | grep -v '^$' | sort -u)

echo "## Backend (Laravel)"
if [ -d "$REPO_ROOT/app" ]; then
    find "$REPO_ROOT/app" "$REPO_ROOT/routes" "$REPO_ROOT/tests" -type f \( -name '*.php' \) 2>/dev/null | while read -r f; do
        rel=${f#$REPO_ROOT/}
        if [ -n "$KEYWORDS" ]; then
            echo "$KEYWORDS" | while read -r kw; do
                [ -z "$kw" ] && continue
                if grep -qi "$kw" "$f" 2>/dev/null; then
                    echo "  backend: $rel (keyword: $kw)"
                    break
                fi
            done
        fi
    done
else
    echo "  (scaffold pending — check specs/ contracts)"
fi

echo ""
echo "## Frontend (Flutter)"
if [ -d "$FRONT_ROOT/lib" ]; then
    find "$FRONT_ROOT/lib" "$FRONT_ROOT/test" -type f \( -name '*.dart' \) 2>/dev/null | while read -r f; do
        rel=${f#$FRONT_ROOT/}
        if [ -n "$KEYWORDS" ]; then
            echo "$KEYWORDS" | while read -r kw; do
                [ -z "$kw" ] && continue
                if grep -qi "$kw" "$f" 2>/dev/null; then
                    echo "  front: $rel (keyword: $kw)"
                    break
                fi
            done
        fi
    done
else
    echo "  (scaffold pending — ../CRH-Frontend)"
fi

echo ""
echo "## Specs & contracts"
if [ -d "$FEATURE_DIR" ]; then
    find "$FEATURE_DIR" -type f \( -name '*.md' -o -name '*.yaml' -o -name '*.json' \) 2>/dev/null | while read -r f; do
        echo "  spec: ${f#$REPO_ROOT/}"
    done
fi
if [ -d "$FEATURE_DIR/contracts" ]; then
    find "$FEATURE_DIR/contracts" -type f 2>/dev/null | while read -r f; do
        echo "  contract: ${f#$REPO_ROOT/}"
    done
fi

echo ""
echo "=== End impact scan ==="
