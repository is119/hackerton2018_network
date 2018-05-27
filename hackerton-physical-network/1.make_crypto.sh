#!/bin/bash

if [ $1 = "generate"]; then
    rm -rf crypto-config
    rm -rf channel-artifacts
    cryptogen generate --config=./crypto-config.yml
else
    cryptogen extend --config=./crypto-config.yml
fi