# RetailCRM API

API wrapper для RetailCRM

# Установка Ruby

## Ruby
    $ gem install retailcrm-api
## Rails
добавьте в Gemfile:
    gem 'retailcrm-api'

и запустите `bundle install`.

Затем:
    rails g retailcrm_api:install
## Требования

Необходимо получить api key https://yourdomains.retailcrm.ru/admin/api-keys

## Использование Rails

В файл `config/retailcrm_api.yml` вставьте ваши данные

## Использование Ruby

Сначала создайте экземпляр объекта `RetailcrmApi::Request`:

```ruby
retailcrm = RetailcrmApi::Request.new(api_key: "your_api_key")
```

Вы можете изменять `api_key`, `timeout`, `open_timeout`, `faraday_adapter`, `proxy`, `symbolize_keys`, `logger`, и `debug`:

```ruby
RetailcrmApi::Request.api_key = "your_api_key"
RetailcrmApi::Request.timeout = 15
RetailcrmApi::Request.open_timeout = 15
RetailcrmApi::Request.symbolize_keys = true
RetailcrmApi::Request.debug = false
```

Либо в файле `config/initializers/retailcrm_api.rb` для Rails.

## Debug Logging

Измените `debug: true` чтобы включить логирование в STDOUT.

```ruby
retailcrm = RetailcrmApi::Request.new(api_key: "your_api_key", debug: true)
```

### Custom logger

`Logger.new` используется по умолчанию, но вы можете изменить на свой:

```ruby
retailcrm = RetailcrmApi::Request.new(api_key: "your_api_key", debug: true, logger: MyLogger.new)
```

Или:

```ruby
RetailcrmApi::Request.logger = MyLogger.new
```

# Примеры

```ruby
RetailcrmApi::Request.customers.retrieve.body
#=> {:success=>true, :pagination=>{:limit=>20, :totalCount=>0, :currentPage=>1, :totalPageCount=>0}, :customers=>[]} 
```