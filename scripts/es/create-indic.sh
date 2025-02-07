    CREATE_INDEX() {
      printf '%s\n' "Creating index ${1}"
      curl -k -u"${user}:${password}" \
      -X PUT "${baseUrl}/${index}" \
      -H 'Content-Type: application/json' \
      -d "$SCHEMA"
    }


