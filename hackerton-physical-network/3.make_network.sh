#!/bin/bash

if [ $1 = "down" ]; then
    docker-compose -f docker-compose.yaml down
else
    docker-compose -f docker-compose.yaml up -d
fi