#!/bin/bash
#docker exec -it broker kafka-console-consumer --bootstrap-server localhost:9092 --topic ${1} --from-beginning --property print.key=true
docker exec -it broker kafkacat -b localhost:9092 -t ${1} -C -c1| jq '.'
