# Notes
## ----------------------------------------------------------------------
## Reload prometheus config
## curl -X POST http://localhost:9090/-/reload

## Copy file in container
## docker cp foo.txt container_id:/foo.txt
## ----------------------------------------------------------------------

VOLUME_DIR=~/data
VOLUME_DIR_PR=${VOLUME_DIR}/prometheus
VOLUME_DIR_GF=${VOLUME_DIR}/grafana

all: up-d
up: mkdir
	docker-compose up
up-d: mkdir
	docker-compose up -d
build:
	docker-compose build
stop:
	docker-compose stop
ps:
	docker-compose ps
ps-a:
	docker ps -a
enter:
	docker exec -ti $(ARG) bash
#   sudo make enter ARG=grafana
rm:
	docker rm $(ARG)
# 	sudo make rm ARG=grafana

rmi:
	docker rmi $(ARG)
# 	sudo make rmi ARG=df1

clean: stop
	docker-compose rm -y
	# docker volume rm prometheus
	# docker volume rm grafana
	rm -rf ${VOLUME_DIR_PR}/*
	rm -rf ${VOLUME_DIR_GF}/*
	yes | docker system prune -a --force
	yes | docker volume prune
mkdir:
	@echo "Проверка дирректорий для volumes"
	@if [ ! -d ${VOLUME_DIR} ]; then mkdir ${VOLUME_DIR}; fi
	@if [ ! -d ${VOLUME_DIR_PR} ]; then mkdir ${VOLUME_DIR_PR}; fi
	@if [ ! -d ${VOLUME_DIR_GF} ]; then mkdir ${VOLUME_DIR_GF}; fi
	@echo "Дирректории готовы"

restart: stop clean upd
.PHONY: all up up-d build stop ps ps-a enter rm rmi clean mkdir restart