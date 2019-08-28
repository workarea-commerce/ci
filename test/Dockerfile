FROM ruby:2.6

LABEL "com.github.actions.name"="Run Workarea tests"
LABEL "com.github.actions.description"="Run tests on a Workarea application or plugin."
LABEL "com.github.actions.icon"="circle"
LABEL "com.github.actions.color"="blue"

RUN curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
