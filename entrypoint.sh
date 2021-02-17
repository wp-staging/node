#!/bin/sh

# See: https://github.com/boxboat/fixuid
# Run the fixuid script to map the Docker UID:GID to the www-data UID:GID.
echo -n "Fixing file mode issues ..."
eval $( fixuid -q )
echo -e "\033[32m done\033[0m"
