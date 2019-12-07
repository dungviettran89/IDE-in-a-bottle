#!/bin/bash
export IMAGE=docker.pkg.github.com/dungviettran89/ide-in-a-bottle/ubuntu-jdk:latest
docker build -t "$IMAGE" .