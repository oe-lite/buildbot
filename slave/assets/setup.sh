#!/bin/bash -ex

cd /srv/buildbot
ln -s /srv/setup/start.sh
buildslave create-slave slave localhost:9989 oe-lite foobar
