# souldyor

## Запуск сервиса

Run `conduit serve` from this directory to run the application. For running within an IDE, run `bin/main.dart`. By default, a configuration file named `config.yaml` will be used.

В файле `config.yaml` находятся данные для подключения к БД. Для обновление моделей в БД используйте следующеие команды:

```
conduit db generate # Формирование файла обновления БД на основе ORM
conduit db validate # Проверка корректности
conduit db upgrade  # Обновление БД
```

Для генерации SwaggerUI client, запустите `conduit document client`.

## Добавление клиента

conduit auth add-client --id sme_claimer --secret SecRetSecretSecret
conduit auth add-client --id sme_claimer --secret NsYWltZXI6c21lcGFz

## Тестирование

Тестирование данных необходимо производить на тестовой БД, т.к. создается и модифицируется большое количество мусорных данных

Подключение к PostgreSQL для тестов производится к базе `conduit_test_db`. 
Для запуска тестирования запустите:

```
dart pub run test
```

Настройки подлючения к тестовой БД находятся в файле `config.src.yaml`.

## Git

WARNING! Файлы `config.src.yaml`, `config.yaml` и `database.yaml` ДОЛЖНЫ находиться в исключении git.