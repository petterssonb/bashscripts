#!/bin/bash

# Set your GitHub username and personal access token
GITHUB_USERNAME="Username goes here"
GITHUB_TOKEN="Token goes here"
REPO_NAME="$1"

# Check if the repo name was provided
if [ -z "$REPO_NAME" ]; then
  echo "Usage: $0 <repo-name>"
  exit 1
fi

# Create project directory
mkdir "/home/user/dev/$REPO_NAME"
cd "/home/user/dev/$REPO_NAME" || exit

# Initialize git and create basic files
git init
git checkout -b main
echo "# $REPO_NAME" > README.md
mkdir src include
touch src/.gitkeep
touch include/.gitkeep
echo "bin/" > .gitignore
echo "vscode/" > .gitignore
echo "*.exe" > .gitignore

# Add and commit changes
git add .
git commit -m "First commit"

# Create GitHub repository
RESPONSE=$(curl -s -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/user/repos -d "{\"name\":\"$REPO_NAME\", \"private\": true}")
REPO_URL=$(echo "$RESPONSE" | jq -r .ssh_url)

# Check if the repository was successfully created
if [ "$REPO_URL" == "null" ]; then
  echo "Failed to create GitHub repository"
  echo "$RESPONSE"
  exit 1
fi

# Add remote and push to GitHub
git remote add origin "$REPO_URL"
git push -u origin main

echo "Repository created at $REPO_URL"
