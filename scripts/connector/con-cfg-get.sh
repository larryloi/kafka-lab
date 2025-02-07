#!/bin/bash
source .connector.conf

curl -X GET "http://${baseUrl}/${objUrl}/${1}/config"| jq -S .
