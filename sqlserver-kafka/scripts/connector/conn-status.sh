#!/bin/bash

curl -X GET http://localhost:8083/connectors/${1}/status|jq '.'
