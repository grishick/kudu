#!/bin/sh

kududir=/var/lib/kudu
kudutserverdir="${kududir}/tserver"
kudulogdir=/var/log/kudu

# Create kudu user and directories
if [ -d "$kududir" ]
then
    if ! getent passwd kudu >/dev/null; then
        adduser --system --disabled-login --disabled-password --quiet kudu 
    fi
    chown -R kudu $kududir
    usermod --home $kududir kudu
else
    if ! getent passwd kudu >/dev/null; then
        adduser --system --disabled-login --disabled-password --quiet --home $kududir kudu 
    else
	mkdir -p $kududir
	chown -R kudu $kududir
	usermod --home $kududir kudu
    fi
fi

mkdir -p $kudutserverdir 
mkdir -p $kudulogdir 
chown -R kudu $kudulogdir 
chown -R kudu $kudutserverdir 

# Set kudu as owner of flag file
chown kudu /var/run/kudu-tserver/gflagfile
