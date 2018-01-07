FROM jenkins/jnlp-slave:3.15-1-alpine

# Install Docker client
ENV DOCKER_VERSION 17.12.0-ce

RUN addgroup -S -g 1001 docker
RUN adduser -S -u 1001 -G docker docker
USER docker
RUN apk --update --no-cache add tar curl jq \
    && curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz | tar --strip-components=1 -xz -C /usr/local/bin docker/docker

