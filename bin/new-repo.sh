#!/usr/bin/env bash
set -euo pipefail

REPO_NAME="${1:?usage: new-repo.sh <name> [private|public]}"
VISIBILITY="${2:-private}"

git init .
git add -A
git commit -m "Initial commit" || true # no-op if nothing to commit

gh repo create "$REPO_NAME" --"$VISIBILITY" --source=. --remote=origin --push
