#!/bin/sh

sudo -u buildbot -E /srv/setup/setup.sh

cd /srv/buildbot/slave
sudo -u buildbot buildslave start --nodaemon
