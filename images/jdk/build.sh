#!/bin/bash
export IMAGE=radiocuatoi/ide-in-a-bottle:jdk-next
docker build -t "$IMAGE" .