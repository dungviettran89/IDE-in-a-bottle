#!/bin/bash
set -e
docker compose build
docker compose up -d
sleep 5s
docker compose logs
docker compose exec desktop bash

