#!/bin/bash
export IMAGE=radiocuatoi/ide-in-a-bottle:next
docker build -t "$IMAGE" .