#!/bin/bash
set -e
docker rm -f ide-in-a-bottle-vnc-next-jdk || true
docker build -t ide-in-a-bottle-vnc:next-jdk .
docker run --rm -t --sig-proxy=true \
    -e WIDTH=1280 \
    -e HEIGHT=720 \
    --name ide-in-a-bottle-vnc-next-jdk \
    -p 26080:6080 \
    ide-in-a-bottle-vnc:next-jdk