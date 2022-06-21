#!/usr/bin/env bash

docker build -t test .
docker run --rm --name nginx-builder -itd test bash
docker cp nginx-builder:/bin/nginx .
docker rm -f nginx-builder
