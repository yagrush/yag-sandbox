# yag-sandbox

色々遊ぶ場
Laravel 11 + Laravel Sail


## setup
1. `application/.env.example` をコピーして `.env` に改名
2. `.env` の中身を自分の環境に合わせてカスタマイズする
3. 必要なPHPライブラリをインストールする
```
cd application
composer install
```

## start all
```
make up-dd
```

## php: Laravel Sail

### init
```
make migrate
make seed
```

### test API
http://localhost:8001/api/users

### test web
http://localhost:8001/

### xdebug: Laravel Sail
* .vscode/launch.json
  * `Xdebug: Laravel Sail`

## db
* `application/.env`
  * user: laravel
  * pass: pass

## kvs
* `kvs/redis.conf`
  * pass: pass

## memo
### create laravel project
* curl -s "https://laravel.build/laravel_api" | bash
* make up-dd
* make sh-lara
* php artisan install:api

### composer install: mac
```
brew install composer
cd application
composer install
```
