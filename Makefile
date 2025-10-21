include Makefile.env

ct ?= 

# Helper to conditionally add container argument
CONTAINER_ARG = $(if $(ct),$(ct),)

# Colors for output
RED := \033[31m
GREEN := \033[32m
YELLOW := \033[33m
BLUE := \033[34m
MAGENTA := \033[35m
CYAN := \033[36m
WHITE := \033[37m
RESET := \033[0m

.PHONY: help up down ps logs shell build.connect network.create volume.rm.all volume.list all.up all.down env

help: ## Show this help message
	@echo "$(GREEN)Available targets:$(RESET)"
	@echo "  help              - Show this help message"
	@echo "  network.create    - Create Docker network for integration"
	@echo "  volume.rm.all     - Remove all dangling Docker volumes"
	@echo "  volume.list       - List all Docker volumes"
	@echo "  ps                - List running Docker containers"
	@echo "  up                - Start Docker Compose services"
	@echo "  down              - Stop Docker Compose services"
	@echo "  all.up            - Start all Docker Compose services with 'all' profile"
	@echo "  all.down          - Stop all Docker Compose services with 'all' profile"
	@echo "  logs              - Follow logs of the specified container (set 'ct')"
	@echo "  shell             - Open a bash shell in the specified container (set 'ct')"
	@echo "  build.connect     - Build the custom Kafka Connect Docker image"


network.create:
	@echo "$(YELLOW)Creating Docker network 'integration'...$(RESET)"
	docker network create --driver bridge --subnet 172.199.0.0/24 --gateway 172.199.0.1 integration || true
	# docker network create --driver bridge integration || true

volume.rm.all:
	@echo "$(YELLOW)Removing all dangling Docker volumes...$(RESET)"
	docker volume rm $$(docker volume ls -qf dangling=true)

volume.list:
	@echo "$(GREEN)Docker Volumes:$(RESET)"
	docker volume ls

ps:
	@echo "$(GREEN)All Services Status:$(RESET)"
	docker compose ps

up:
	@echo "$(GREEN)Starting Docker Compose services...$(RESET)"
	docker compose up -d

down:
	@echo "$(GREEN)Stopping Docker Compose services...$(RESET)"
	docker compose down

all.up:
	@echo "$(GREEN)Starting all Docker Compose services with 'all' profile...$(RESET)"
	docker compose --profile all up -d

all.down:
	@echo "$(GREEN)Stopping all Docker Compose services with 'all' profile...$(RESET)"
	docker compose --profile all down

logs:
	@echo "$(GREEN)Following logs for container: ${ct}$(RESET)"
	docker compose logs -f ${ct}

shell:
	@echo "$(GREEN)Opening bash shell in container: ${ct}$(RESET)"
	docker compose exec -u root ${ct} bash

# CONNECT_IMAGE = cp-connect-7.6.0-mysql-3.0.8
# CONNECT_IMAGE = cp-connect-7.8.0-mysql-3.0.8
# CONNECT_IMAGE = cp-connect-7.6.0-sftp-3.2.14
# CONNECT_IMAGE = cp-connect-7.6.0-mysql-3.0.8-spooldir-2.0.65
# CONNECT_IMAGE = cp-connect-7.8.0-mysql-3.0.8-mongodb-3.1.2
# CONNECT_TAG = kas-0.1.0

build.connect:
	docker build -t ${CONNECT_IMAGE}:${CONNECT_TAG} -f ./Dockerfiles/Dockerfile-${CONNECT_IMAGE} .


# ===================================
# Environment Targets
# ===================================

.PHONY: env
env: ## Show environment configuration
	@echo "$(GREEN)Environment Configuration:$(RESET)"
	@echo "  CONNECT_IMAGE: $(CONNECT_IMAGE)"
	@echo "  CONNECT_TAG:   $(CONNECT_TAG)"
	@echo ""