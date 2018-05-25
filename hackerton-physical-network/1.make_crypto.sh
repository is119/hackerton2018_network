#!/bin/bash

if [ $1 = "generate"]; then
    cryptogen generate --config=./crypto-config.yml
else
    cryptogen extend --config=./crypto-config.yml
fi