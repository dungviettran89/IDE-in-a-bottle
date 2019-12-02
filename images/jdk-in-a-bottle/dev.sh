#!/bin/bash
set -e
docker rm -f jdk-in-a-bottle-vnc-dev || true
docker build -t jdk-in-a-bottle:next .
docker run --rm -t --sig-proxy=true \
    -e WIDTH=1280 \
    -e HEIGHT=720 \
    --name jdk-in-a-bottle-vnc-dev \
    -p 26080:6080 \
    jdk-in-a-bottle:next