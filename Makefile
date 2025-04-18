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

connect.build.780:
	docker build -t quay.io/larryloi/cp-server-connect-7.8.0-kas:latest -f ./Dockerfile-connect-cp-780 .

connect.build.760:
	docker build -t quay.io/larryloi/cp-server-connect-7.6.0-kas:latest -f ./Dockerfile-connect-cp-760 .
