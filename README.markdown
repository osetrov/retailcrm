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
params = {
  filter: {
    minSumm: 0
  }
}
RetailcrmApi::Request.costs.retrieve(params: params).body
# => {:success=>true, :pagination=>{:limit=>20, :totalCount=>296, :currentPage=>1, :totalPageCount=>15}, :costs=>[{:id=>296, :dateFrom=>"2021-07-29", :dateTo=>"2021-07-29", :summ=>13996, :costItem=>"products-purchase-price", :createdAt=>"2021-07-29 00:34:35", :order=>{:id=>36, :number=>"36C"}, :sites=>["b12-skillum-ru"]}]}
```
### [Создание расхода](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-costs-create)
```ruby
body = {
  site: "deppa-ru",
  cost: {
    summ: 100,
    costItem: "office-expenses",
    dateFrom: (DateTime.now - 1.day).strftime("%Y-%m-%d"),
    dateTo: DateTime.now.strftime("%Y-%m-%d")
  }
}
RetailcrmApi::Request.costs.create(body: body).body
# => {:success=>true, :id=>297}
```
### [Пакетное удаление расходов](https://docs.retailcrm.ru/Developers/APIhttps://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-costs-delete)
```ruby
body = {
  ids: [297]
}
RetailcrmApi::Request.costs.create(body: body, suffix: "delete").body
# => {:success=>true, :count=>1, :notRemovedIds=>[]}
```
### [Пакетная загрузка расходов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-costs-upload)
```ruby
body = {
  costs: [
    {
      sites: ["deppa-ru"],
      summ: 100,
      costItem: "office-expenses",
      dateFrom: (DateTime.now - 1.day).strftime("%Y-%m-%d"),
      dateTo: DateTime.now.strftime("%Y-%m-%d")
    }
  ]
}
RetailcrmApi::Request.costs.create(body: body, suffix: "upload").body
# => {:success=>true, :uploadedCosts=>[298]}
```
### [Получение информации о расходе](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-costs-id)
```ruby
RetailcrmApi::Request.costs(298).retrieve.body
# => {:success=>true, :cost=>{:id=>298, :dateFrom=>"2021-08-02", :dateTo=>"2021-08-03", :summ=>100, :costItem=>"office-expenses", :createdAt=>"2021-08-03 22:12:34", :sites=>["deppa-ru"]}} 
```
### [Редактирование расхода](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-costs-id-edit)
```ruby
body = {
  site: "deppa-ru",
  cost: {
    summ: 200,
    costItem: "office-expenses",
    dateFrom: (DateTime.now - 1.day).strftime("%Y-%m-%d"),
    dateTo: DateTime.now.strftime("%Y-%m-%d")
  }
}
RetailcrmApi::Request.costs(298).update(body: body).body
# => {:success=>true, :id=>298}
```
### [Удаление расхода](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-costs-id-delete)
```ruby
RetailcrmApi::Request.costs(298).delete.body
# => {:success=>true}
```

## Пользовательские поля
### [Получение списка пользовательских полей, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-custom-fields)
```ruby
params = {
  filter: {
    type: "date"
  }
}
RetailcrmApi::Request.custom_fields.retrieve(params: params).body
# =>{:success=>true, :pagination=>{:limit=>20, :totalCount=>0, :currentPage=>1, :totalPageCount=>0}, :customFields=>[]}
```

## Клиенты
### [Получение списка клиентов, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-customers)
```ruby
params = {
  limit: 100,
  filter: {
    sex: "male"
  }
}
RetailcrmApi::Request.customers.retrieve(params: params).body
#=> {:success=>true, :pagination=>{:limit=>100, :totalCount=>0, :currentPage=>1, :totalPageCount=>0}, :customers=>[]} 
```
### [Создание клиента](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-create)
```ruby
body = {
  site: 'deppa-ru',
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
  site: 'deppa-ru',
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
### [Получение списка корпоративных клиентов, удовлетворяющих заданному фильтру](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#get--api-v5-customers-corporate)
```ruby
RetailcrmApi::Request.customers_corporate.retrieve.body
# => {:success=>true, :pagination=>{:limit=>20, :totalCount=>0, :currentPage=>1, :totalPageCount=>0}, :customersCorporate=>[]} 
```

### [Пакетная загрузка корпоративных клиентов](https://docs.retailcrm.ru/Developers/API/APIVersions/APIv5#post--api-v5-customers-corporate-upload)
```ruby
body = {
  site: 'deppa-ru"',
  customersCorporate: [
    {
      externalId: 3,
      nickName: 'test1'
    },
    {
      externalId: 4,
      nickName: 'test2'
    }
  ]
}
```