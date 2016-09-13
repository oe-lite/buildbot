#!/bin/sh

# to rebuild master
# docker rm buildbot-master && docker rmi buildbot-master && cd /srv/buildbot/master && docker build -t buildbot-master .

docker run -d --name=buildbot-master -p 8010:8010 -p 9989:9989 -v /srv/buildbot/data:/srv/buildbot/master buildbot-master
