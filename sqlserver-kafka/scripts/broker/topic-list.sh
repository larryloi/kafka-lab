#!/bin/bash
source .broker.conf

docker exec -it broker kafka-topics --list --bootstrap-server ${bootserverUrl} | grep -v "^_"
