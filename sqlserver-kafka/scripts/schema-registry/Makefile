Command := $(firstword $(MAKECMDGOALS))
Arguments := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))

hello:
	@echo "Hello, "$(Arguments)"!";

%::
	@true
