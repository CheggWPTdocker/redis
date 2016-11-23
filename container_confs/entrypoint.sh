#!/bin/sh
# ----------------------------------------------------------------------------
# entrypoint for container
# ----------------------------------------------------------------------------
set -e

HOST_IP=`/bin/grep $HOSTNAME /etc/hosts | /usr/bin/cut -f1`
echo
echo "container started with ip: ${HOST_IP}..."
echo
for script in /docker-init.d/*; do
	case "$script" in
		*.sh)     echo "... running $script"; . "$script" ;;
		*)        echo "... ignoring $script" ;;
	esac
	echo
done

if [ "$1" == "redis" ]; then
	echo "starting redis with...."
	echo /usr/bin/redis-server --protected-mode no --loglevel verbose 
	/usr/bin/redis-server --protected-mode no --loglevel verbose 
elif [ "$1" == "bash" ] || [ "$1" == "shell" ]; then
	echo "starting /bin/bash with /etc/profile..."
	/bin/bash --rcfile /etc/profile
else
	echo "Running something else"
	exec "$@"
fi
