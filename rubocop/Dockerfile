FROM ruby:2.6

LABEL "com.github.actions.name"="Run Rubocop"
LABEL "com.github.actions.description"="Run Rubocop, a Ruby static code analyzer and formatter."
LABEL "com.github.actions.icon"="circle"
LABEL "com.github.actions.color"="red"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
