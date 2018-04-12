#!/bin/bash
## DREMIO Init
echo "Starting Dremio ..."
export JAVA_HOME=/usr/java/jre1.8.0_131

sudo chown -R dremio:dremio /var/log/dremio
sudo chown -R dremio:dremio /var/lib/dremio
sudo chown -R dremio:dremio /var/run/dremio 

/etc/init.d/dremio start

echo "Watching Dremio Logs ..."
tail -f /var/log/dremio/*
