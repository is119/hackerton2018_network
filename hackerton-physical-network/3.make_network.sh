#!/bin/bash

if [ $1 -n "down"]; then
    docker-compose -f docker-compose.yaml -down
else
    docker-compose -f docker-compose.yaml -up d