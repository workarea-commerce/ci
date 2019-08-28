#!/bin/sh

# Exit if any subcommand fails
set -e

echo "# Bundling..."
bundle install --jobs 4 --retry 3
bundle exec $(bundle exec rake -T | grep services:up | sed 's/\\w*#.*//')

if [ -z "$1" ]; then
  command="bin/rails test test/**/*_test.rb"
else
  command="$@"
fi

echo "\n# Running tests..."
sh -c "CI=true $command"
