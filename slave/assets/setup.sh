#!/bin/sh -ex

# Apply default values
MASTER="${MASTER:-buildbot.oe-lite.org:9989}"
SLAVE_NAME="${SLAVE_NAME:-example-slave}"
SLAVE_PASSWD="${SLAVE_PASSWD:-pass}"

# This script is run as root on image build, and as buildbot user on container
# start.

if [ $(whoami) = root ] ; then
    # This script is run as root on image build.

    cd /srv/buildbot
    sudo -u buildbot ln -s /srv/setup/start.sh

else
    # This script is run as buildbot user on container start.

    if [ ! -e /srv/buildbot/slave/buildbot.tac ] ; then
	cd /srv/buildbot
	buildslave create-slave slave \
	    "${MASTER}" "${SLAVE_NAME}" "${SLAVE_PASSWD}"
	cat >> slave/buildbot.tac <<EOF
import sys
from twisted.python import log
log.FileLogObserver(sys.stdout).start()
EOF
	if [ -n "${SLAVE_ADMIN}" ] ; then
	    echo "${SLAVE_ADMIN}" > slave/info/admin
	fi
	if [ -n "${SLAVE_DESCRIPTION}" ] ; then
	    echo "${SLAVE_DESCRIPTION}" > slave/info/host
	fi
    fi

fi
