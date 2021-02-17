FROM node:lts-alpine3.13

USER root

ENV DEBIAN_FRONTEND=noninteractive

# Set up the entrypoint and set it as the default command.
COPY wps-entrypoint.sh /wps-entrypoint.sh
RUN chmod 755 /wps-entrypoint.sh
CMD ["/wps-entrypoint.sh"]

# Commands should run from this directory, by default.
WORKDIR /var/www
