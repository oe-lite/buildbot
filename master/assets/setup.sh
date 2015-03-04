#!/bin/bash -ex

cd /srv/buildbot
ln -s /srv/setup/start.sh
mkdir -p master
cp /srv/setup/config/* master/
buildbot create-master -f master
rm master/master.cfg.sample
