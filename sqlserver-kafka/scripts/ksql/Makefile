Command := $(firstword $(MAKECMDGOALS))
Arguments := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))

hello:
	@echo "Hello, "$(Arguments)"!";

ksqldb:
	docker exec -it ksqldb-cli ksql http://ksqldb-server:8088

%::
	@true
