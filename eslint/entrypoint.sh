#!/bin/sh

# Exit if any subcommand fails
set -e
cd $GITHUB_WORKSPACE

echo "\n# Installing ESLint..."
npm install -g eslint

if [ -z "$1" ]; then
  glob="."
else
  glob="$@"
fi

echo "\n# Running ESLint..."
sh -c "eslint $glob"
