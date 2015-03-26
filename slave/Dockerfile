# Base docker image
FROM jpetazzo/dind

# Docker image for OE-lite.org buildbot slave
MAINTAINER Esben Haabendal <esben@haabendal.dk>

# Install buildbot and docker package dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
        python-pip python-dev git sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install buildbot itself and pip dependencies
RUN pip install buildbot-slave

# Install setup and start scripts and buildbot configuration
COPY assets /srv/setup/

# Setup buildbot user
RUN useradd -r -m -d /srv/buildbot -s /bin/bash buildbot && \
    usermod -aG docker buildbot && \
    chown -R buildbot:buildbot /srv/setup
WORKDIR /srv/buildbot

# Setup whatever is possible to do at image build time (not much...)
RUN /srv/setup/setup.sh

CMD ["wrapdocker", "./start.sh"]
