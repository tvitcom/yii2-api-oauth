# yii2-api-oauth

Необходимо реализовать сервис с следующим функционалом на языке PHP с использованием фреймворка Laravel(Yii).
В базе данных должна быть таблица users c колонками:
id — первичный ключ
name — Имя пользователя
email — Email пользователя
password — Пароль пользователя
status — Статус пользователя

Реализовать 2 REST API метода:
POST /login — авторизация по паролю
GET /users — должен возвращать список пользователей с возможность пагинации
Так же реализовать авторизацию с помощью Google Account-а.
API должно быть закрыто bearer авторизацией.

## prerequisit:

linux: ubuntu 18,16... or debian 7, 8, 9, 10
php 7.2 && apache2.4 or nginx && mariadb5.x or mysql 5.x

# Setup for development

Run bash commands:

```
mkdir -m 777 -p /var/www/yii2-api-oauth/approot
cd /var/www/yii2-api-oauth/approot
git clone git@github.com:tvitcom/yii2-api-oauth .
curl -sS https://getcomposer.org/installer | php;
php composer.phar update
sudo chmod -R 0777 frontend/assets/ \
    frontend/runtime/ \
    backend/assets/ \   
    rest/runtime \
    rest/assets \  
    backend/runtime/ \
    web/assets  \
    web/admin/assets \
    web/api/assets;

### Notices
!!! Please setup appropriate configs files in common/config, console/config, backend/config, rest/config, frontend/config
!!! Please make web server config for webroot:
/var/www/yii2-api-oauth/approot/web
!!! Rename _deploy_to_prod.sh and set appropriate variables in deploy_to_prod.sh 
Ready!
```

# Deploy for production

From developer host:

```bash
sh deploy_to_prod.sh
```

# Application architecture: 
In this project implemented Yii 2 Advanced Project includes three tiers: front end, back end, console and api part of web application

DIRECTORY STRUCTURE
-------------------

```
common
    config/              contains shared configurations
    mail/                contains view files for e-mails
    models/              contains model classes used in both backend and frontend
    tests/               contains tests for common classes    
console
    config/              contains console configurations
    controllers/         contains console controllers (commands)
    migrations/          contains database migrations
    models/              contains console-specific model classes
    runtime/             contains files generated during runtime
backend
    assets/              contains application assets such as JavaScript and CSS
    config/              contains backend configurations
    controllers/         contains Web controller classes
    models/              contains backend-specific model classes
    runtime/             contains files generated during runtime
    tests/               contains tests for backend application    
    views/               contains view files for the Web application
    frontend/web/admin/  contains the entry script and Web resources for backend part
frontend
    assets/              contains application assets such as JavaScript and CSS
    config/              contains frontend configurations
    controllers/         contains Web controller classes
    models/              contains frontend-specific model classes
    runtime/             contains files generated during runtime
    tests/               contains tests for frontend application
    views/               contains view files for the Web application
    web/                 contains the entry script and Web resources
    widgets/             contains frontend widgets
rest
    assets/              contains application assets such as JavaScript and CSS
    config/              contains rest configurations
    controllers/         contains Web controller classes
    models/              contains rest-specific model classes
    runtime/             contains files generated during runtime
    tests/               contains tests for rest application    
    views/               contains view files for the Web application
    frontend/web/apiX/   contains the entry script for appropriate api version: X (semver condition)
vendor/                  contains dependent 3rd-party packages
environments/            contains environment-based overrides
```

# Test and debug

Test json GET response w/o PrettyUrl:

```bash

curl -X GET http://bekey/index.php?r=users -H 'content-type: application/json'

```

Test json GET response with PrettyUrl:

```bash

curl -X GET http://bekey/users -H 'content-type: application/json'

```
