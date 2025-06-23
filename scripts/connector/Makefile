include connect.conf

list:
	curl -X GET http://$(baseUrl)/$(objUrl)/| jq 'sort'
	curl -s "http://$(baseUrl)/$(objUrl)?expand=info&expand=status" | \
  jq '. | to_entries[] | [ .value.info.type, .key, .value.status.connector.state,.value.status.tasks[].state, .value.info.config."connector.class"] |join(":|:")' | \
  column -s : -t| sed 's/\"//g'| sort

#list:
#	curl -X GET http://$(baseUrl)/$(objUrl)/| jq 'sort'
#	curl -s "http://$(baseUrl)/$(objUrl)?expand=info&expand=status" | \
#  jq '. | to_entries[] | [ .key, .value.info.type,  .value.status.connector.state,.value.status.tasks[].state, .value.info.config."connector.class"] |join(":|:")' | \
#  column -s : -t| sed 's/\"//g'| sort

list.one:
	curl -s "http://$(baseUrl)/$(objUrl)/${name}/status"| jq -c -M '[.name,.connector.state,.tasks[].state]|join(":|:")'

up:
	CONN_FILE=$(shell pwd)/${name}; \
	CONN=$$(cat $${CONN_FILE}); \
	echo "Creating connector $${name}"; \
	curl -k -X POST "${baseUrl}/${objUrl}" -H 'Content-Type: application/json' -d "$${CONN}" | jq '.'

down:
	curl -X DELETE http://${baseUrl}/${objUrl}/${name}
	curl -X GET http://${baseUrl}/${objUrl}/| jq 'sort'

status:
	curl -X GET http://${baseUrl}/${objUrl}/${name}/status|jq '.'
	

plugins:
	curl -X GET http://${baseUrl}/connector-plugins | jq '.[].class'

config:
	curl -X GET "http://${baseUrl}/${objUrl}/${name}/config"| jq -S .

