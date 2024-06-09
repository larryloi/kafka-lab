docker.network.create.integration:
	docker network create --driver bridge integration || true

docker.volume.rm.all:
	docker volume rm $$(docker volume ls -qf dangling=true)
