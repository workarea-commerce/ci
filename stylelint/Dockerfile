FROM node:12.9.0

LABEL "com.github.actions.name"="Run stylelint"
LABEL "com.github.actions.description"="Run stylelint, a mighty, modern linter that helps you avoid errors and enforce conventions in your styles."
LABEL "com.github.actions.icon"="circle"
LABEL "com.github.actions.color"="yellow"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
