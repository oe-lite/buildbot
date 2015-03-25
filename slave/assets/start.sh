#!/bin/sh

cd /srv/buildbot/slave
sudo -u buildbot buildslave start --nodaemon
