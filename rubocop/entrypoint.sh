#!/bin/sh

# Exit if any subcommand fails
set -e

echo "GITHUB_WORKSPACE: $GITHUB_WORKSPACE"
pwd
ls -alh

ls -alh /
ls -alh $GITHUB_WORKSPACE
env

cd $GITHUB_WORKSPACE
pwd
ls -alh

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
