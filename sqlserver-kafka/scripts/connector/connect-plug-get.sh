#!/bin/bash

curl -X GET http://localhost:8083/connector-plugins | jq '.[].class'
