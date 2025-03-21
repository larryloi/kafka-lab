include topic.conf

topic.list:
	docker exec -it broker1 kafka-topics --list --bootstrap-server $(bootserverUrl) | grep -v "^_"

topic.monit:
	docker exec -it broker1 kafka-console-consumer --bootstrap-server $(bootserverUrl) --topic $(name) --from-beginning --property print.key=true

topic.desc:
	docker exec -it broker1 kafka-topics --describe --bootstrap-server $(bootserverUrl) --topic $(name)

topic.del:
	docker exec -it broker1 kafka-topics --delete --bootstrap-server $(bootserverUrl) --topic $(name)

consumer.list:
	docker exec -it broker1 /usr/bin/kafka-consumer-groups --list --bootstrap-server $(bootserverUrl)

consumer.del:
	docker exec -it broker1 /usr/bin/kafka-consumer-groups --bootstrap-server $(bootserverUrl) --delete --group $(name)

%::
	@true
