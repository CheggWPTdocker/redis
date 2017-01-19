#!/bin/sh
# ----------------------------------------------------------------------------
# entrypoint for container
# ----------------------------------------------------------------------------
set -e
echo "starting redis with...."
# echo /usr/bin/redis-server --protected-mode no --loglevel verbose 
echo /usr/bin/redis-server --protected-mode no --redirecting all output to dev null
/usr/bin/redis-server --protected-mode no >/dev/null 2>&1
