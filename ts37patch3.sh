#!/usr/bin/env bash

# Training Server 3.7 Patchlevel 3
#
# Run this script as "root"

if [[ ! -f /etc/patchlevel || $(cat /etc/patchlevel) != 2 ]]; then 
    echo You must install patch2 first
    exit
fi

echo
echo Patch Level 2 confirmed
echo

#move new MS Edge files to server1 folder
echo moving files...
mv browserspecific.html.edge /var/www/server/1/browserspecific.html
mv edge.png /var/www/server/1/

#confirm new Edge browserspecific.html page loads
echo
echo
echo testing new html page...
echo http://172.16.20.1/browserspecific.html
echo
curl http://172.16.20.1/browserspecific.html
echo

# Set 3 to patchlevel file
echo 3 >/etc/patchlevel
echo Patch 3 installed
echo
