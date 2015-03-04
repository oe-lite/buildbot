# Base docker image
FROM ubuntu:14.04.2

# Docker image for OE-lite.org buildbot master
MAINTAINER Esben Haabendal <esben@haabendal.dk>

# Install buildbot package dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update && \
    apt-get install -qqy \
        python-pip python-dev git sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install buildbot itself and pip dependencies
RUN pip install buildbot-slave

# Install setup and start scripts and buildbot configuration
COPY assets /srv/setup/

# Setup buildbot user
RUN useradd -r -m -d /srv/buildbot -s /bin/bash buildbot && \
    chown -R buildbot:buildbot /srv/setup
USER buildbot
WORKDIR /srv/buildbot

# Create and configure buildbot master
RUN /srv/setup/setup.sh

CMD ./start.sh
