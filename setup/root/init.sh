#!/bin/bash

# exit script if return code != 0
set -e

# set permissions inside container
if [[ -n $PIPEWORK_WAIT ]]; then
	echo "[info] Waiting on interface eth1 to come up"
	/root/pipework --wait
fi

if [[ ! -d /config ]]; then
	echo "[info] linking /var/log to /config"
	ln -s /var/log /config
fi

echo "[info] Starting Supervisor..."
"/usr/bin/supervisord" -c "/etc/supervisor.conf" -n
