# Base docker image
FROM ubuntu:14.04

# Docker image for OE-lite.org buildbot master
MAINTAINER Esben Haabendal <esben@haabendal.dk>

# Install buildbot package dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
	python-pip python-dev git sudo \
	libffi-dev libssl-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install buildbot and required dependencies
RUN git clone http://github.com/buildbot/buildbot -b eight && \
    cd buildbot/master && ./setup.py install

# Install optional buildbot dependencies
RUN pip install txgithub service_identity

# Install setup and start scripts and buildbot configuration
COPY assets /srv/setup/

# Setup buildbot user
RUN useradd -r -m -d /srv/buildbot -s /bin/bash buildbot && \
    chown -R buildbot:buildbot /srv/setup && \
    install -o buildbot -g buildbot -d /srv/buildbot/master
USER buildbot
WORKDIR /srv/buildbot

# Buildbot master dir in volume.  Either mount it from a data volume
# container, from host directory, or just let it stay in the buildbot-master
# container.
VOLUME /srv/buildbot/master

# Setup whatever is possible to do at image build time (not much...)
RUN /srv/setup/setup.sh

CMD ["./start.sh"]

# Exposed ports
EXPOSE 8010 9989
