#!/bin/ash
# pull-and-wait.sh

set -e

# Get the latest code
git pull

url="$1"
shift
cmd="$@"

until wget -O- "$url"; do
  >&2 echo "Selenium is unavailable - sleeping"
  sleep 1
done

>&2 echo "Selenium is up - executing command"
exec $cmd
