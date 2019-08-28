#!/bin/sh

# Exit if any subcommand fails
set -e
cd $GITHUB_WORKSPACE

if [ -f "package.json" ]; then
  echo "# Packaging..."
  yarn install
fi

# Install ESLint if needed
if ! yarn list | grep "eslint"; then
  echo "\n# Installing ESLint..."
  yarn add --non-interactive --silent --dev eslint --loglevel error
fi

if [ -z "$1" ]; then
  glob="."
else
  glob="$@"
fi

echo "\n# Running ESLint..."
sh -c "yarn run eslint $glob"
