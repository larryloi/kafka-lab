include .broker.conf

list:
	docker exec -it broker kafka-topics --list --bootstrap-server $(bootserverUrl) | grep -v "^_"

show:
	docker exec -it broker kafka-console-consumer --bootstrap-server $(bootserverUrl) --topic $(topic) --from-beginning --property print.key=true

rm:
	docker exec -it broker kafka-topics --delete --bootstrap-server $(bootserverUrl) --topic $(topic)

%::
	@true
