#!/bin/sh

# Exit if any subcommand fails
set -e
cd $GITHUB_WORKSPACE

# Setup Rubocop
echo "\n# Installing rubocop..."
gem install rubocop

if [ -z "$1" ]; then
  glob="."
else
  glob="$@"
fi

echo "\n# Running Rubocop..."
sh -c "rubocop $glob"
