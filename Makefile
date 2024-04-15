
up:
	docker-compose --env-file application/.env up

up-d:
	docker-compose --env-file application/.env up --build

up-dd:
	docker-compose --env-file application/.env up --build  -d
	# @make migrate
	# @make seed

stop:
	docker-compose stop

down:
	docker-compose down

log:
	docker-compose logs -f

sh-php:
	docker container exec -it phpfpm bash

sh-lara:
	docker container exec -it laravel bash

sh-db:
	docker container exec -it db bash

sh-kvs:
	docker container exec -it kvs bash

migrate:
	docker container exec -it laravel php artisan migrate

seed:
	docker container exec -it laravel php artisan db:seed

tail-lara:
	docker container exec -it laravel tail -f -n 30 storage/logs/laravel.log

tail-db:
	docker container exec -it db tail -f /tmp/log/db_query.log /tmp/log/mysqld.log

tail-kvs:
	docker container exec -it kvs tail -f /var/log/redis/redis.log

# downと同時に名前付きボリュームを全て削除する
down-v:
	docker-compose down --volume --rmi local

# 未使用のDcokerオブジェクトを掃除する
docker-prune:
	docker system prune -a

ls:
	docker container ls
