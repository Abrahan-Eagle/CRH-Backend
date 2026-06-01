#!/bin/bash
# CRH Skills Setup — Cross-agent compatibility (Cursor + Gemini only)
# Creates symlink for Gemini skills → canonical .agents/skills/

SKILLS_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$(dirname "$SKILLS_DIR")")"

declare -A AGENTS=(
  [".gemini/skills"]="Gemini"
)

echo "🔧 Setting up cross-agent skill symlinks (Cursor + Gemini)..."

for agent_path in "${!AGENTS[@]}"; do
  agent_name="${AGENTS[$agent_path]}"
  target="$PROJECT_DIR/$agent_path"

  if [ -L "$target" ]; then
    echo "⏭️  $agent_name — symlink already exists"
  elif [ -d "$target" ]; then
    echo "⚠️  $agent_name — directory exists (skipping)"
  else
    mkdir -p "$(dirname "$target")"
    ln -s "$SKILLS_DIR" "$target"
    echo "✅ $agent_name — symlink created"
  fi
done

echo "🎉 Setup complete! Cursor uses .cursor/ + .agents/skills; Gemini uses .gemini/skills → .agents/skills"
