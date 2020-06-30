#!/usr/bin/env bash
# Copyright (c) 2020 Mike Swierczek, licensed under the Apache Software License, Version 2.
# Please contact me or open a Github issue to relicense.

# Set this script to run as root in a directory, using a cron job or anacron, on the
# server or VM that is running Sandstorm.

CERTDATA=`echo 'db.settings.findOne({_id: "tlsKeys"})' | /opt/sandstorm/sandstorm mongo`

echo $CERTDATA | sed "s/^MongoDB.*key\" : \"\([^\"]*\)\".*/\1/" | sed "s/\\\n/\\n/g" > sandstorm.key
echo $CERTDATA | sed "s/^MongoDB.*certChain\" : \"\([^\"]*\)\".*/\1/" | sed "s/\\\n\\\n/\\n/g" | sed "s/\\\n/\\n/g" > sandstorm.pem
