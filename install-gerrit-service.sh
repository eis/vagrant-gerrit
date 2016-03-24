#!/bin/bash

if [ "$USER" != "root" ]
then
        echo "Needs to be run as root user!" >&2
        exit 1
fi

set -exo pipefail

cp /opt/gerrit/bin/gerrit.sh /etc/init.d/gerrit
chkconfig --add gerrit
chkconfig --list gerrit
chkconfig --level 0123456 gerrit on
chkconfig --list gerrit
echo "GERRIT_SITE=/opt/gerrit" > /etc/default/gerritcodereview

