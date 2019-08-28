#!/bin/sh

# Exit if any subcommand fails
set -e

# The docs say the workspace will have the checked out repo but that doesn't
# seem to be the case.
cd $GITHUB_WORKSPACE
git clone git@github.com:$GITHUB_REPOSITORY.git .
git checkout $GITHUB_SHA

if [ -f "Gemfile" ]; then
  echo "# Bundling..."
  bundle install --jobs 4 --retry 3
fi

# Setup Rubocop if needed
if [ ! `which rubocop` ]; then
  echo "\n# Installing rubocop..."
  gem install rubocop
fi

if [ -z "$1" ]; then
  glob="."
else
  glob="$@"
fi

echo "\n# Running Rubocop..."
sh -c "rubocop $glob"
