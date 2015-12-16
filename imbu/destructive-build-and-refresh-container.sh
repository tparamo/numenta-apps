#!/bin/bash

rm -rf `pwd`/cache/*
docker kill imbu
docker rm imbu
docker build -t imbu:latest .
docker run \
  --name imbu \
  -d \
  -p 8080:80 \
  -e CORTICAL_API_KEY=${CORTICAL_API_KEY} \
  -e IMBU_RETINA_ID=${IMBU_RETINA_ID} \
  -v `pwd`/cache:/opt/numenta/imbu/cache \
  imbu:latest
