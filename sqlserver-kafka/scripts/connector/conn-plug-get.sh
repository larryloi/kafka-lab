#!/bin/bash
source .connector.conf

curl -X GET http://${baseUrl}/connector-plugins | jq '.[].class'
