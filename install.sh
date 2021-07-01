#!/bin/bash
loc="/usr/lib/systemd/user"
INSTALLED_DIR=`pwd`
loc="/usr/lib/systemd/user"

if [ -f "/usr/lib/systemd/system/mostd.service" ]; then
	loc="/usr/lib/systemd/system"
	installed=1
fi
if [ -f "/usr/lib/systemd/user/mostd.service" ]; then
	loc="/usr/lib/systemd/user"
	installed=1
fi

if [ $installed ]; then
	echo "MOSTD is installed!"
	echo "unit-file: $loc/mostd.service"
	exit
fi

if [[ "$INSTALLED_DIR" != "/opt/mostd" ]]; then
	echo "Please move this entire directory to /opt/mostd and re-try"
fi

echo "Deploying service file via symlink to: $loc"
ln -s $INSTALLED_DIR/mostd.service $loc/mostd.service
