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
RUN useradd -m -d /srv/buildbot -s /bin/bash buildbot && \
    usermod -aG docker buildbot && \
    chown -R buildbot:buildbot /srv/setup
WORKDIR /srv/buildbot

# Setup whatever is possible to do at image build time (not much...)
RUN /srv/setup/setup.sh

CMD ["wrapdocker", "./start.sh"]

RUN apt-get update && \
    apt-get install -y \
    	python-support \
    	python-magic \
    	python-pycurl \
    	python-pkg-resources \
    	python-dev \
    	coreutils \
    	sed \
    	git-core \
    	cvs \
    	subversion \
    	mercurial \
    	quilt \
    	gawk \
    	texinfo \
    	automake \
    	autoconf \
    	autopoint \
    	libtool \
    	curl \
    	texi2html \
    	diffstat \
    	openjade \
    	groff \
    	mtd-utils \
    	build-essential \
    	make \
    	gcc \
    	g++ \
    	binutils \
    	bison \
    	flex \
    	bc \
    	ncurses-dev \
    	unzip \
    	lzma \
    	gtk-doc-tools \
    	docbook-utils \
    	libxml2-utils \
    	xmlto \
    	help2man \
    	libglib2.0-dev \
    	lzop \
    	gperf \
    	python-svn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
