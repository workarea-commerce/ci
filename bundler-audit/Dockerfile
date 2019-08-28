FROM ruby:2.6

LABEL "com.github.actions.name"="Run bundler-audit"
LABEL "com.github.actions.description"="Run bundler-audit, patch-level verification for bundler."
LABEL "com.github.actions.icon"="circle"
LABEL "com.github.actions.color"="red"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
