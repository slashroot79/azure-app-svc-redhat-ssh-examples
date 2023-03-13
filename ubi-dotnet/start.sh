#!/bin/sh
set -e

# Get env vars in the Dockerfile to show up in the SSH session
eval $(printenv | sed -n "s/^\([^=]\+\)=\(.*\)$/export \1=\2/p" | sed 's/"/\\\"/g' | sed '/=/s//="/' | sed 's/$/"/' >> /etc/profile)

cd /etc/ssh
ssh-keygen -A

echo "Starting ssh as user: $(whoami)"
/usr/sbin/sshd

echo "Starting dotnet process (running rhel specific build)..."
/app/rkubidotnet/build/rkubidotnet
