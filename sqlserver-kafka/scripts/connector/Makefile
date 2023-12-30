include .connector.conf

list:
	curl -X GET http://$(baseUrl)/$(objUrl)/| jq 'sort'
	curl -s "http://$(baseUrl)/$(objUrl)?expand=info&expand=status" | \
  jq '. | to_entries[] | [ .value.info.type, .key, .value.status.connector.state,.value.status.tasks[].state, .value.info.config."connector.class"] |join(":|:")' | \
  column -s : -t| sed 's/\"//g'| sort

new:
	CONN_FILE=$(shell pwd)/${conn}; \
	CONN=$$(cat $${CONN_FILE}); \
	echo "Creating connector $${conn}"; \
	curl -k -X POST "${baseUrl}/${objUrl}" -H 'Content-Type: application/json' -d "$${CONN}" | jq '.'

rm:
	curl -X DELETE http://${baseUrl}/${objUrl}/${conn}
	curl -X GET http://${baseUrl}/${objUrl}/| jq 'sort'

status:
	curl -X GET http://${baseUrl}/${objUrl}/${conn}/status|jq '.'
	

plugins:
	curl -X GET http://${baseUrl}/connector-plugins | jq '.[].class'

config:
	curl -X GET "http://${baseUrl}/${objUrl}/${conn}/config"| jq -S .
