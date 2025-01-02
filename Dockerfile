FROM cartagodocker/nodebun:latest
USER root

ARG NESTJS_VERSION=10.4.9

#NODE_DEFAULT_VERSION inherent from cartagodocker/nodebun:latest, change NODE_DEFAULT_VERSION, if you want to use another version
RUN eval $(fnm env) && fnm use ${NODE_DEFAULT_VERSION} \ 
    && bun i -g @nestjs/cli@${NESTJS_VERSION} \
    # Clean cache and tmp
    && rm -rf /var/lib/apt/lists/* /tmp/* || true