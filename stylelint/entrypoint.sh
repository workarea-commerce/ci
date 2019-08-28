#!/bin/sh

# Exit if any subcommand fails
set -e
cd $GITHUB_WORKSPACE

echo "# Installing yarn..."
yarn install

# Install stylelint if needed
if ! yarn list | grep "stylelint"; then
  echo "\n# Installing stylelint..."
  yarn add --non-interactive --silent --dev stylelint --loglevel error
fi

if [ -z "$1" ]; then
  glob="."
else
  glob="$@"
fi

echo "\n# Running stylelint..."
sh -c "yarn run stylelint $glob"
