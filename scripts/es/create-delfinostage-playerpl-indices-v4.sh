#!/bin/bash

set -eu

source "$(dirname $0)/config-delfinostage"

merchantPartSize=(
  "indibet|1"
  "pb|1"
  "bfb247|1"
  "yy828|1"
  "omed|1"
  "betnow|1"
  "96in|1"
)

version="v4"

for mp in ${merchantPartSize[@]}; do
  m=$(printf '%s' "${mp}" | cut -d'|' -f1)
  n=$(printf '%s' "${mp}" | cut -d'|' -f2)
  n=$((n - 1))
  for i in $(seq 0 ${n}); do
    index="player_pl_${version}_${m}_${i}"
    printf '%s\n' "${index}"
    curl -k -u"${user}:${password}" \
      -X PUT "${baseUrl}/${index}" \
      -H "Content-Type: application/json" \
      -d '{
        "settings": {
          "index": {
            "number_of_shards": 2,
            "number_of_replicas": 1,
            "final_pipeline": "ingestTime",
            "max_result_window": 100000
          }
        },
        "mappings": {
          "properties": {
            "@timestamp": {
              "type": "date"
            },
            "bbAmt": {
              "type": "scaled_float",
              "scaling_factor": 100
            },
            "basePl": {
              "type": "scaled_float",
              "scaling_factor": 100
            },
            "bAmt": {
              "type": "scaled_float",
              "scaling_factor": 100
            },
            "cTime": {
              "type": "date"
            },
            "cCode": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "normalizer": "lowercase"
                }
              }
            },
            "cId": {
              "type": "integer"
            },
            "cRate": {
              "type": "scaled_float",
              "scaling_factor": 10000000000
            },
            "cc" : {
              "type" : "text",
              "fields" : {
                "keyword" : {
                  "type" : "keyword",
                  "normalizer": "lowercase"
                }
              }
            },
            "dpId": {
              "type": "long"
            },
            "gCat": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "normalizer": "lowercase"
                }
              }
            },
            "gCode": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "normalizer": "lowercase"
                }
              }
            },
            "gc" : {
              "type" : "text",
              "fields" : {
                "keyword" : {
                  "type" : "keyword",
                  "normalizer": "lowercase"
                }
              }
            },
            "giId": {
              "type": "long"
            },
            "gn": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "normalizer": "lowercase"
                }
              }
            },
            "gpId": {
              "type": "long"
            },
            "gpn": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "normalizer": "lowercase"
                }
              }
            },
            "grId": {
              "type": "long"
            },
            "grSta": {
              "type": "byte"
            },
            "ingestTime": {
              "type": "date"
            },
            "luTime": {
              "type": "date"
            },
            "pl": {
              "type": "scaled_float",
              "scaling_factor": 100
            },
            "prId": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "normalizer": "lowercase"
                }
              }
            },
            "pbAmt": {
              "type": "scaled_float",
              "scaling_factor": 100
            },
            "pcCode": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "normalizer": "lowercase"
                }
              }
            },
            "pcId": {
              "type": "long"
            },
            "pcRate": {
              "type": "scaled_float",
              "scaling_factor": 10000000000
            },
            "pId": {
              "type": "long"
            },
            "pn": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "normalizer": "lowercase"
                }
              }
            },
            "pPl": {
              "type": "scaled_float",
              "scaling_factor": 100
            },
            "ppId": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "normalizer": "lowercase"
                }
              }
            },
            "ppn": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "normalizer": "lowercase"
                }
              }
            },
            "rst": {
              "type": "integer"
            },
            "rText": {
              "type": "text",
              "fields": {
                "keyword": {
                  "type": "keyword",
                  "normalizer": "lowercase"
                }
              }
            },
            "sTime": {
              "type": "date"
            },
            "wAmt": {
              "type": "scaled_float",
              "scaling_factor": 100
            }
          }
        }
      }'
    printf '\n'
  done
done
