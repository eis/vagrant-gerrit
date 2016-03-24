#!/bin/bash
if [ "$USER" != "root" ]
then
        echo "Needs to be run as root user!" >&2
        exit 1
fi

set -exo pipefail

useradd -d /opt/gerrit gerrit
yum install git -y
yum install gitweb -y # should make /var/www/git/gitweb.cgi available

