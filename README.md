# souldyor

## Запуск сервиса

Для начала необходимо установить дарт и кондуит: 
```
# Ставим новые пакеты
sudo apt-get update && sudo apt-get install apt-transport-https
# Качаем ключи
wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub \
  | sudo gpg  --dearmor -o /usr/share/keyrings/dart.gpg
# Добавляем репозиторий
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' \
  | sudo tee /etc/apt/sources.list.d/dart_stable.list
# Ставим дарт
sudo apt-get update && sudo apt-get install dart
# Ставим кондуит
dart pub global activate conduit
# Создать новый файл для патча
sudo nano /etc/profile.d/mypath.sh
# Добавить содержимое:
export PATH="$PATH":"$HOME/.pub-cache/bin"
# Установить правильные права доступа
sudo chmod +x /etc/profile.d/mypath.sh
# ребут
sudo reboot
```

Запуск сервиса `conduit serve` из дириктории файла `bin/main.dart`. 

В файле `config.yaml` находятся данные для подключения к БД. Для обновление моделей в БД используйте следующеие команды:

```
conduit db generate # Формирование файла обновления БД на основе ORM
conduit db validate # Проверка корректности
conduit db upgrade  # Обновление БД
```

Для генерации SwaggerUI client, запустите `conduit document client`.


## Добавление клиента

conduit auth add-client --id tg_souldyor --secret СЕКРЕТНЫЙ_КЛЮЧ
conduit auth add-client --id mt_souldyor --secret СЕКРЕТНЫЙ_КЛЮЧ

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