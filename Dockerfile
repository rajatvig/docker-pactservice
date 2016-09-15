FROM ruby:2.3.1

ARG VCS_REF
ARG IMAGE_VERSION

LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/rajatvig/docker-pactservice" \
      org.label-schema.name="pactservice" \
      org.label-schema.description="Publish Pacts to a Pact Broker" \
      org.label-schema.version=$IMAGE_VERSION \
      org.label-schema.schema-version="1.0" \
      org.label-schema.docker.cmd="docker run -d -t -p '1234:80' -v './pacts:/pacts' rajatvig/pactservice:latest"

ENV LOG_DIR /var/log/pactservice
ENV NGINX_DIR /etc/nginx
ENV PID_FILE /var/run/supervisord.pid

RUN mkdir -p $LOG_DIR && \
    apt-get update && \
    apt-get install -y supervisor nginx && \
    rm -rf /var/lib/apt/lists/*

RUN gem install pact-mock_service

WORKDIR /var/run

COPY supervisord.conf /var/run
COPY nginx.conf $NGINX_DIR
COPY proxy.conf $NGINX_DIR/conf.d

RUN rm $NGINX_DIR/sites-enabled/default

EXPOSE 80

CMD ["supervisord", "-n"]
