include topic.conf

topic.list:
	docker exec -it broker kafka-topics --list --bootstrap-server $(bootserverUrl) | grep -v "^_"

topic.show:
	docker exec -it broker kafka-console-consumer --bootstrap-server $(bootserverUrl) --topic $(name) --from-beginning --property print.key=true

topic.rm:
	docker exec -it broker kafka-topics --delete --bootstrap-server $(bootserverUrl) --topic $(name)

%::
	@true
