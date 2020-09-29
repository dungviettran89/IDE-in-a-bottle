#!/bin/bash
export IMAGE=radiocuatoi/novnc-server:next
docker build -t "$IMAGE" .