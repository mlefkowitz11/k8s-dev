#!/bin/bash
# save as codex-push.sh and chmod +x codex-push.sh

set -e  # exit immediately if a command fails

# Make sure we're on main
git checkout main

# Pull latest changes from GitHub
git pull origin main --rebase

# Stage all changes
git add -A

# Commit with timestamp
git commit -m "Codex run: $(date +"%Y-%m-%d %H:%M:%S")" || echo "No changes to commit."

# Push everything back to main
git push origin main

