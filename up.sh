#!/bin/bash
arg0=$1

if [ $arg0 == "pill" ]; then
    WORKERNAME=$HOSTNAME docker-compose --env-file .env --file docker-compose.yml --file docker-compose.ohgodpill.yml up -d --build
else
    WORKERNAME=$HOSTNAME docker-compose --env-file .env --file docker-compose.yml up -d --build
fi



