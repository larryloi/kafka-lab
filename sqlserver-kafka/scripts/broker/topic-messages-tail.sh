#!/bin/bash
source .broker.conf

docker exec -it broker kafka-console-consumer --bootstrap-server ${bootserverUrl} --topic ${1} --from-beginning --property print.key=true 
