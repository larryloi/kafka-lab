#!/bin/bash

curl -X DELETE http://localhost:8083/connectors/${1}

curl -X GET http://localhost:8083/connectors/| jq 'sort'
