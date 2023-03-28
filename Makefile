
VOLUME_DIR=~/data
VOLUME_DIR_PR=${VOLUME_DIR}/prometheus
VOLUME_DIR_GF=${VOLUME_DIR}/grafana

all: upd
up: mkdir
	docker-compose up
upd: mkdir
	docker-compose up -d
build: mkdir
	docker-compose build
stop:
	docker-compose stop
ps:
	docker-compose ps
psa:
	docker ps -a
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
.PHONY: all up upd build stop ps psa clean mkdir restart
