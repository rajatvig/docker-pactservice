FROM ruby:2.3.1

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
