#!/bin/bash

ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

echo "" >> ~/.bash_profile
echo "if [ -z \"\$SSH_AUTH_SOCK\" ] ; then" >> ~/.bash_profile
echo "    eval \`ssh-agent -s\`" >> ~/.bash_profile
echo "    ssh-add" >> ~/.bash_profile
echo "fi" >> ~/.bash_profile

. ~/.bash_profile

