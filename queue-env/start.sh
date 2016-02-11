#!/bin/bash

# START the docker machine first
# docker-machine start dev
eval "$(docker-machine env dev)"
docker-compose up
