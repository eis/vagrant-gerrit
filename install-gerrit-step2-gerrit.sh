#!/bin/bash

if [ "$USER" != "gerrit" ]
then
	echo "Needs to be run as gerrit user!" >&2
	exit 1
fi

set -exo pipefail

cp /vagrant/gerritconfigs/*.config ~
java -jar /vagrant/gerrit-2.12.2.war
java -jar /vagrant/gerrit-2.12.2.war init --batch --site-path /opt/gerrit
java -jar bin/gerrit.war reindex -d /opt/gerrit


