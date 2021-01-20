FROM debian:buster-slim

# Default timezone to UTC
ENV TMZ UTC

COPY nginx.sh /usr/bin/nginx.sh
RUN chmod 755 /usr/bin/nginx.sh

RUN export DEBIAN_FRONTEND='noninteractive' && \
    apt-get update -qq && \
    apt-get install -qqy --no-install-recommends nginx &&\
    apt-get clean && \
    sed -i 's/#gzip/gzip/' /etc/nginx/nginx.conf && \
    sed -i "/http_x_forwarded_for\"';/s/';/ '/" /etc/nginx/nginx.conf && \
    rm -rf /etc/nginx/sites-enabled/* && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY default.conf /etc/nginx/conf.d/

EXPOSE 80 443

ENTRYPOINT ["nginx.sh"]