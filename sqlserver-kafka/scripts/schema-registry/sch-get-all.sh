#!/bin/bash
source .registry.conf

docker exec -it schema-registry  curl -X GET http://${baseUrl}/${objUrl} | jq
