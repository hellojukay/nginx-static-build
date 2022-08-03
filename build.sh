#!/usr/bin/env bash

docker build -t test .
docker run --rm --name nginx-builder -itd test bash
mkdir bin
docker cp nginx-builder:/bin/nginx bin/nginx
docker rm -f nginx-builder
