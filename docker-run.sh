#!/usr/bin/env zsh

#
# This script simply executes a provided JavaScript test using
# the local environment established with the `docker-compose`.
# 
# Each execution is provided a unique tag to differentiate
# discrete test runs within the Grafana dashboard.
#

set -e

if [ $# -ne 1 ]; then
    echo "Usage: ./docker-run.sh basic_k6_test.js"
    exit 1
fi

SCRIPT_NAME=basic_k6_test.js
TAG_NAME="$(basename -s .js $SCRIPT_NAME)-$(date +%s)"

docker-compose run --rm k6 run -<$SCRIPT_NAME --tag testid=$TAG_NAME
