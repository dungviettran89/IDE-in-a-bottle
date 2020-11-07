#!/bin/bash
set -e
. ./build.sh
export CONTAINER=ide-in-a-bottle-ubuntu-jdk-latest
docker rm -f "$CONTAINER" || true
docker run --rm -it \
 --name="$CONTAINER" \
 -v /data/ssd2/ide-test:/home/developer \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -p 16080:6080 \
 "$IMAGE"