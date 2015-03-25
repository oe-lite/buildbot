#!/bin/bash -ex

cd /srv/buildbot
ln -s /srv/setup/start.sh
mkdir -p slave
cp /srv/setup/config/* slave/
buildslave create-slave slave 172.17.42.1:9989 example-slave pass
if [ -e slave/buildbot.tac.new ] ; then
  mv slave/buildbot.tac.new slave/buildbot.tac
fi
cat >> slave/buildbot.tac <<EOF
import sys
from twisted.python import log
log.FileLogObserver(sys.stdout).start()
EOF
