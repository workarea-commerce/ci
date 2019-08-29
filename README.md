# Workarea CI Actions

This repository offers GitHub Actions for running CI on the [Workarea Commerce Platform](https://github.com/workarea-commerce/workarea). These actions will work for plugins or host applications. To see how they're used, check out the [CI Action](https://github.com/workarea-commerce/workarea/blob/master/.github/workflows/ci.yml) in the base platform repository.

## GitHub Action for bundler-audit
This action runs [bundler-audit](https://github.com/rubysec/bundler-audit) against the root Gemfile in a repository. It doesn't take any arguments.

## GitHub Action for ESLint
This action runs [ESLint](https://eslint.org) against the repository. If the project includes ESLint as part of its package, it will use that. Otherwise, it will install and use the latest version. You can pass arguments to ESLint with the `args` key like so:
```yaml
- uses: workarea-commerce/ci/eslint@v1
  with:
    args: my/js/to/lint/**/*.js
```

## GitHub Action for Rubocop
This action runs [Rubocop](https://github.com/rubocop-hq/rubocop) against the repository. If the project includes rubocop in its Gemfile, this version will be used. If the project does not include rubocop, the action will install the latest version and use that. You can pass arguments to rubocop with the `args` key like so:
```yaml
- uses: workarea-commerce/ci/rubocop@v1
  with:
    args: -c path/to/my/config/rubocop.yml
```

## GitHub Action for stylelint
This action runs [stylelint](https://stylelint.io) against the repository. If the project includes stylelint as part of its package, it will use that. Otherwise, it will install and use the latest version. You can pass arguments to ESLint with the `args` key like so:
```yaml
- uses: workarea-commerce/ci/stylelint@v1
  with:
    args: my/stylesheets/to/lint/**/*.js
```

## GitHub Action for test
This action sets up and runs tests for the project. It provides:
* Bundling based on the root Gemfile
* Starting Workarea services based on the version of Workarea in the Gemfile
* Setting the CI=true environment variable

By default the test command it will run is `bin/rails test`, but you can customize that with the `command` option like so:
```yaml
- uses: workarea-commerce/ci/test@v1
  with:
    command: bin/rails test:system
```
