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
    config/              contains backend configurations
    controllers/         contains Web controller classes
    models/              contains backend-specific model classes
    runtime/             contains files generated during runtime
    tests/               contains tests for backend application    
    views/               contains view files for the Web application
    frontend/web/apiX/   contains the entry script for appropriate api version
vendor/                  contains dependent 3rd-party packages
environments/            contains environment-based overrides
```
