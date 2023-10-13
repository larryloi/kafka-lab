#!/bin/bash

source .connector.conf
environments=("test" "staging" "production")



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

    CONF_VALID() {
      if [[ $# -ne 1 ]]; then
      #if [[ "$1" -gt "-1" ]]; then
      #if [ $# -ne 1 ]; then
         echo "No arguments supplied"
         PRINT_USAGE
         exit 1
      else
         echo "good"
      fi

    }


#    CREATE_CONNECT() {
#      printf '%s\n' "Creating connector ${1}"
#      curl -k -u"${user}:${password}" \
#      -X PUT "${baseUrl}/${index}" \
#      -H 'Content-Type: application/json' \
#      -d "$SCHEMA"
#    }

    CREATE_CONNECT() {
      printf '%s\n' "Creating connector ${1}"
      curl -k \
      -X POST "${baseUrl}/${objUrl}" \
      -H 'Content-Type: application/json' \
      -d "$SCHEMA"
    }

#echo $#
#echo $@
#CONF_VALID
SCHEMA_FILE=$(pwd)/${1}
SCHEMA=$(cat ${SCHEMA_FILE})

CREATE_CONNECT

curl -X GET http://localhost:8083/connectors/| jq 'sort'
