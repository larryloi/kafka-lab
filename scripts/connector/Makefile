include connect.conf

# Colors for output
RED := \033[31m
GREEN := \033[32m
YELLOW := \033[33m
BLUE := \033[34m
MAGENTA := \033[35m
CYAN := \033[36m
WHITE := \033[37m
RESET := \033[0m


.PHONY: help list list.one up down status plugins config

help:
	@echo "$(GREEN)Available targets:$(RESET)"
	@echo "  $(CYAN)list$(RESET)        - List all connectors with their status"
	@echo "  $(CYAN)list.one$(RESET)    - Show status of a single connector"
	@echo "  $(CYAN)up$(RESET)          - Create a connector from a JSON file named after the connector"
	@echo "  $(CYAN)down$(RESET)        - Delete a connector"
	@echo "  $(CYAN)status$(RESET)      - Show status of a connector"
	@echo "  $(CYAN)plugins$(RESET)     - List available connector plugins"
	@echo "  $(CYAN)config$(RESET)      - Show configuration of a connector"

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

