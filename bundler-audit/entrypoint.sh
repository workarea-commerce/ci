#!/bin/sh

# Exit if any subcommand fails
set -e
cd $GITHUB_WORKSPACE

if [ -f "Gemfile" ]; then
  echo "# Bundling..."
  bundle install --jobs 4 --retry 3
fi

# Setup bundler-audit if needed
if [ ! `which bundler-audit` ]; then
  echo "\n# Installing bundler-audit..."
  gem install bundler-audit
fi

echo "\n# Running bundler-audit..."
sh -c "bundle audit check --update ${INPUT_ARGS}"
