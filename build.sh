#!/bin/bash

docker build -t project .
docker-compose down || true
docker-compose up -d
