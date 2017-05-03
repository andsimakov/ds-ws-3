.ONESHELL:

build:
	export COMPOSE_FILE=common.yml:build.yml:image.yml
	docker-compose build chat_django
	docker-compose run --rm chat_django
	docker-compose down -v
	docker-compose build chat_django_build
	docker-compose build chat_postgres
	docker-compose build chat_nginx

push:
	export COMPOSE_FILE=common.yml:build.yml:image.yml
	docker-compose push chat_django
	docker-compose push chat_postgres
	docker-compose push chat_nginx

test:
	export COMPOSE_FILE=common.yml:dev.yml:depends.yml:test.yml
	docker-compose run --rm chat_django
	docker-compose down -v

release:
	git describe --always

ci_env:
	echo PROJECT_VERSION=`git describe --always`
	echo COMPOSE_PROJECT_NAME=${BUILD_TAG}
	echo PROJECT_NAME=chat
	echo HUB_HOST=hub.example.com
	echo LOCAL_USER_ID=`id -u`
