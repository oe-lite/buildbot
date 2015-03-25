#!/bin/bash -ex

cd /srv/buildbot
ln -s /srv/setup/start.sh
mkdir -p master
cp /srv/setup/config/* master/
buildbot create-master master
rm master/master.cfg.sample
if [ -e master/buildbot.tac.new ] ; then
  mv master/buildbot.tac.new master/buildbot.tac
fi
cat >> master/buildbot.tac <<EOF

import sys
from twisted.python import log
log.FileLogObserver(sys.stdout).start()
EOF
