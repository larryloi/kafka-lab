#!/bin/bash
source .connector.conf

curl -X DELETE http://${baseUrl}/${objUrl}/${1}

curl -X GET http://${baseUrl}/${objUrl}/| jq 'sort'
