
network.create:
	docker network create --driver bridge --subnet 172.199.0.0/24 --gateway 172.199.0.1 integration || true
	# docker network create --driver bridge integration || true

volume.rm.all:
	docker volume rm $$(docker volume ls -qf dangling=true)

volume.list:
	docker volume ls

ps:
	docker compose ps

up: 
	docker compose up -d

down:
	docker compose down

all.up:
	docker compose --profile all up -d

all.down:
	docker compose --profile all down

logs:
	docker compose logs -f ${name}


# CONNECT_IMAGE = cp-connect-7.6.0-mysql-3.0.8
# CONNECT_IMAGE = cp-connect-7.8.0-mysql-3.0.8
CONNECT_IMAGE = cp-connect-7.6.0-sftp-3.2.14
CONNECT_TAG = kas-0.1.0


build.connect:
	docker build -t ${CONNECT_IMAGE}:${CONNECT_TAG} -f ./Dockerfiles/Dockerfile-${CONNECT_IMAGE} .
