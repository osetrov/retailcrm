# RetailCRM API

API wrapper для RetailCRM

# Установка

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

## Расходы

### [Получение списка расходов, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-costs)
```ruby
RetailcrmApi::Request.costs.retrieve.body
# => {:success=>true, :pagination=>{:limit=>20, :totalCount=>296, :currentPage=>1, :totalPageCount=>15}, :costs=>[{:id=>296, :dateFrom=>"2021-07-29", :dateTo=>"2021-07-29", :summ=>13996, :costItem=>"products-purchase-price", :createdAt=>"2021-07-29 00:34:35", :order=>{:id=>36, :number=>"36C"}, :sites=>["b12-skillum-ru"]}]}
```

## Клиенты
### [Получение списка клиентов, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-customers)
```ruby
RetailcrmApi::Request.customers.retrieve.body
#=> {:success=>true, :pagination=>{:limit=>20, :totalCount=>0, :currentPage=>1, :totalPageCount=>0}, :customers=>[]} 
```
### [Создание клиента](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-create)
```ruby
body = {
  site: 'deppa',
  customer: {
    externalId: 1,
    firstName: 'Павел',
    lastName: 'Осетров'
  }
}
RetailcrmApi::Request.customers.create(body: body).body
#=> {:success=>true, :id=>54}
```
### [Пакетная загрузка клиентов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-upload)
```ruby
body = {
  site: 'deppa',
  customers: [
    {
      externalId: 3,
      firstName: 'Имя',
      lastName: 'Фамилия'
    },
    {
      externalId: 4,
      firstName: 'Имя2',
      lastName: 'Фамилия2'
    }
  ]
}
RetailcrmApi::Request.customers.create(body: body, suffix: "upload").body
```

## Корпоративные клиенты

```ruby
RetailcrmApi::Request.customers_corporate.retrieve.body
# => {:success=>true, :pagination=>{:limit=>20, :totalCount=>0, :currentPage=>1, :totalPageCount=>0}, :customersCorporate=>[]} 
```