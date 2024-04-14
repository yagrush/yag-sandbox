
up:
	docker-compose up

up-d:
	docker-compose up --build

up-dd:
	docker-compose up --build -d

stop:
	docker-compose stop

down:
	docker-compose down

log:
	docker-compose logs -f

sh-php:
	docker container exec -it yag-phpfpm bash

sh-db:
	docker container exec -it yag-db bash

sh-kvs:
	docker container exec -it yag-kvs bash

tail-db:
	docker container exec -it yag-db tail -f /tmp/log/db_query.log /tmp/log/mysqld.log

tail-kvs:
	docker container exec -it yag-kvs tail -f /var/log/redis/redis.log

# downと同時に名前付きボリュームを全て削除する
down-v:
	docker-compose down --volume

# 未使用のDcokerオブジェクトを掃除する
docker-prune:
	docker system prune -a

ls:
	docker container ls