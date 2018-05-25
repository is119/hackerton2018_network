#!/bin/bash

if [ $1 -n "generate"]; then
    cryptogen generate --config=./crypto-config.yml
else
    cryptogen extend --config=./crypto-config.yml
fi