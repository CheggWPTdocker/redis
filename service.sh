#!/bin/sh
# ----------------------------------------------------------------------------
# entrypoint for container
# ----------------------------------------------------------------------------
echo "starting redis with...."
echo /usr/bin/redis-server --protected-mode no --loglevel verbose 
/usr/bin/redis-server --protected-mode no --loglevel verbose 
