#!/bin/sh

# Exit if any subcommand fails
set -e
cd $GITHUB_WORKSPACE

echo "\n# Installing stylelint..."
npm install -g stylelint stylelint-scss stylelint-config-recommended-scss

if [ -z "$1" ]; then
  glob="."
else
  glob="$@"
fi

echo "\n# Running stylelint..."
sh -c "stylelint $glob"
