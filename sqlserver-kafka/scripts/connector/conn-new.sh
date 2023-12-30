#!/bin/bash

source .connector.conf

    LOG_INF() {
      MSG=$1; printf '%s' "`date` [INF:] $MSG"; printf '%s\n' 
      }

    LOG_ERR() {
        MSG=$1; printf '%s' "`date` [ERR:] $MSG"; printf '%s\n' 
    }

    # Function to print usage message
    PRINT_USAGE() {
        LOG_INF "Usage: $0 [connector-config]"
        LOG_INF "Example: $0 dst-es-emp01"
    }


    CREATE_CONNECT() {
      printf '%s\n' "Creating connector ${1}"
      curl -k \
      -X POST "${baseUrl}/${objUrl}" \
      -H 'Content-Type: application/json' \
      -d "$SCHEMA" | jq '.' 
    }

SCHEMA_FILE=$(pwd)/${1}
SCHEMA=$(cat ${SCHEMA_FILE})

CREATE_CONNECT

curl -X GET http://${baseUrl}/${objUrl}/| jq 'sort'
