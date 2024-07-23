include topic.conf

topic.list:
	docker exec -it broker kafka-topics --list --bootstrap-server $(bootserverUrl) | grep -v "^_"

topic.monit:
	docker exec -it broker kafka-console-consumer --bootstrap-server $(bootserverUrl) --topic $(name) --from-beginning --property print.key=true

topic.desc:
	docker exec -it broker kafka-topics --describe --bootstrap-server $(bootserverUrl) --topic $(name)

topic.rm:
	docker exec -it broker kafka-topics --delete --bootstrap-server $(bootserverUrl) --topic $(name)

%::
	@true
