FROM node:lts-alpine3.13

USER root

ENV DEBIAN_FRONTEND=noninteractive

# Add curl
RUN apk --no-cache add curl

# Install fix uid
RUN curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.5/fixuid-0.5-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid

COPY fixuid-config.yml /etc/fixuid/config.yml

# Set up the entrypoint and set it as the default command.
COPY wps-entrypoint.sh /wps-entrypoint.sh
RUN chmod 755 /wps-entrypoint.sh
CMD ["/wps-entrypoint.sh"]

# Commands should run from this directory, by default.
WORKDIR /var/www
