#!/bin/sh

sudo -u buildbot -E /srv/setup/setup.sh

cd /srv/buildbot/slave
sudo -HEu buildbot buildslave start --nodaemon
