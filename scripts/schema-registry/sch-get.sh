#!/bin/bash
source .registry.conf

docker exec -it schema-registry  curl -X GET http://${baseUrl}/${objUrl}/${1}/versions/1 | jq
